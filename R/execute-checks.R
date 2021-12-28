#' @title Load and parse checks in a yaml file, and return a list
#' of useful objects.
#' @param ds The [data.frame] to be checked.  Required.
#' @param checks The [list] describing the check.  Is the output of
#' [trawler::load_checks()].  Required.
#'
#' @examples
#' # Replace the paths for your specific project
#' path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
#' path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")
#'
#' ds_pt_event  <- readr::read_rds(path_data)
#' checks       <- load_checks(path_checks)
#'
#' execute_checks(ds_pt_event, checks)
#'
#' @export
execute_checks <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_data_frame(checks$smells)

  smells <- execute_smells(ds, checks)

  structure(
    list(
      smells        = smells$ds_smell_result,
      smell_status  = smells$smell_status
    ),
    class = "trawler_checks"
  )
}

#' @importFrom rlang .data
execute_smells <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
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
    smell_status    = smell_status
  )
}
