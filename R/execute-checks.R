#' @title Execute the checks against a dataset to return a nested list.
#' @param ds The [data.frame] to be checked.  Required.
#' @param checks The [list] describing the check.  Is the output of
#' [trawler::load_checks()].  Required.
#'
#' @examples
#' # Replace the two paths for your specific project
#' path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
#' path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")
#'
#' ds_pt_event  <- readr::read_rds(path_data)
#' checks       <- load_checks(path_checks)
#'
#' execute_checks(ds_pt_event, checks)
#'
#' # saveRDS(execute_checks(ds_pt_event, checks), "inst/derived/biochemical.rds")
#'
#' @export
execute_checks <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_class(checks, "trawler_checks_definition")
  checkmate::assert_data_frame(checks$smells)

  smells  <- execute_smells(ds, checks)
  rules   <- execute_rules(ds , checks)

  structure(
    list(
      record_id_name      = checks$record_id_name,
      baseline_date_name  = checks$baseline_date_name,
      record_id_link      = checks$record_id_link,
      github_file_prefix  = checks$github_file_prefix,
      redcap_codebook     = checks$redcap_codebook,

      smells        = smells$ds_smell_result,
      smell_status  = smells$smell_status,
      smells_inactive = smells$smells_inactive,

      rules         = rules$rules,
      rule_status   = rules$rule_status,
      rules_inactive= rules$rules_inactive
    ),
    class = "trawler_checks"
  )
}

#' @importFrom rlang .data
execute_smells <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_class(checks, "trawler_checks_definition")
  checkmate::assert_data_frame(checks$smells)

  # fs <- smells$equation |>
  #   purrr::invoke_map(function(x) eval(parse(text=x)), .)

  ds_smell_result <-
    checks$smells |>
    dplyr::mutate(
      # f             = purrr::invoke_map(function(x) eval(parse(text=x)), .data$equation),
      value   = NA_real_,
      pass    = NA
    )

  # for( i in 1:14 ) {
  for (i in seq_len(nrow(ds_smell_result))) { # i <- 2L

    if (checks$smells$debug[i]) {
      browser() #nocov
    }

    f <- convert_equation(checks$smells$equation[i], checks$smells$check_name[i])

    tryCatch({
      ds_smell_result$value[i]   <- f(ds)
    }, error = function(e) {
      stop("Problem executing the equation for smell `", checks$smells$check_name[i], "`.\n", e)
    })

    # ds_smell_result$smell_value[i]   <- f[[i]](ds)
    ds_smell_result$pass[i]    <- dplyr::between(ds_smell_result$value[i], left = ds_smell_result$bound_lower[i], right = ds_smell_result$bound_upper[i])
  }

  ds_smell_result <-
    ds_smell_result |>
      dplyr::select(
        .data$check_name,
        .data$pass,
        tidyselect::everything()
      )

  smell_status <-
    sprintf(
      "%i smells have been sniffed.  %i violation(s) were found.",
      nrow(ds_smell_result),
      sum(!ds_smell_result$pass)
    )

  list(
    ds_smell_result = ds_smell_result,
    smell_status    = smell_status,
    smells_inactive = checks$smells_inactive
  )
}

#' @importFrom rlang .data
execute_rules <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_class(checks, "trawler_checks_definition")
  checkmate::assert_data_frame(checks$rules)

  ds_rule_violation_list <- list()
  # for( i in 1:2 ) { # i <- 1L
  for (i in seq_len(nrow(checks$rules))) {

    if (checks$rules$debug[i]) {
      browser()
    }

    tryCatch({
      f <- eval(parse(text = checks$rules$passing_test[i]))
    }, warning = function(e) {
      stop("Problem parsing the equation for the rule `", checks$rules$check_name[i], "`.\n", e)
    }, error = function( e ) {
      stop("Problem parsing the equation for the rule `", checks$rules$check_name[i], "`.\n", e)
    })

    tryCatch({
      violations <- !f(ds)
    }, warning = function(e) {
      stop("Problem executing the equation for rule `", checks$rules$check_name[i], "`.\n", e)
    }, error = function(e) {
      stop("Problem executing the equation for rule `", checks$rules$check_name[i], "`.\n", e)
    })

    index      <- length(ds_rule_violation_list) + 1L
    # browser()
    # print(index)
    ds_violation_single <- ds |>
      dplyr::filter(violations)


    if (0L < nrow(ds_violation_single)) {
      ds_rule_violation_list[[index]] <-
        ds_violation_single |>
        dplyr::select(
          record_id               = checks$record_id_name,
          "data_collector",
          baseline_date           = checks$baseline_date_name
        ) |>
        dplyr::mutate(
          check_name                = checks$rules$check_name[i],
          error_message             = checks$rules$error_message[i],
          priority                  = checks$rules$priority[i],
          instrument                = checks$rules$instrument[i]
        ) |>
        dplyr::select(.data$check_name, .data$record_id, .data$data_collector, .data$error_message, .data$priority, .data$instrument, .data$baseline_date)
    }
    rm(f, index, violations, ds_violation_single)
  } # End for loop

  ds_rule_results <-
    ds_rule_violation_list |>
    dplyr::bind_rows() |>
    dplyr::select(
      .data$check_name,
      .data$record_id,
      .data$data_collector,
      .data$baseline_date,
    ) |>
    dplyr::arrange(.data$check_name, .data$record_id) |>
    dplyr::group_by(.data$check_name) |>
    tidyr::nest(
      results = -.data$check_name
    ) |>
    dplyr::mutate(
      violation_count = purrr::map_int(.data$results, nrow)
    )

  rule_status <-
    sprintf(
      "%i rules were examined. %i rule(s) had at least 1 violation. %i total violation(s) were found.",
      nrow(checks$rules),
      length(ds_rule_results$results),
      sum(ds_rule_results$violation_count)
    )

  checks$rules <-
    checks$rules |>
    dplyr::left_join(ds_rule_results, by = "check_name") |>
    dplyr::mutate(
      violation_count   = dplyr::coalesce(.data$violation_count, 0L),
    ) |>
    dplyr::select(
      .data$check_name,
      .data$violation_count,
      tidyselect::everything(),
    )

  list(
    rules           = checks$rules,
    rule_status     = rule_status,
    rules_inactive  = checks$rules_inactive
  )
}
