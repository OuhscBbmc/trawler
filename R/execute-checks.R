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
  checkmate::assert_data_frame(checks$ds_smell)

  ds_smell_result <- execute_smells(ds, checks)

  list(
    ds_smell_result = ds_smell_result
  )

}

#' @importFrom rlang .data
execute_smells <- function (ds, checks) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_data_frame(checks$ds_smell)

  # cat(
  #   glue::glue("{nrow(ds_smell)} smells [have been defined]({checks$github_file_prefix}/{path_checks}):\n\n"),
  #   ds_smell |>
  #     glue::glue_data("1. {check_name};"),
  #   sep = "\n"
  # )

  # fs <- ds_smell$equation |>
  #   purrr::invoke_map(function(x) eval(parse(text=x)), .)

  ds_smell_result <-
    checks$ds_smell |>
    dplyr::mutate(
      # f             = purrr::invoke_map(function(x) eval(parse(text=x)), .data$equation),
      value   = NA_real_,
      pass    = NA
    )

  # for( i in 1:14 ) {
  for (i in seq_len(nrow(ds_smell_result))) { # i <- 2L

    if (checks$ds_smell$debug[i]) {
      browser()
    }

    tryCatch({
      f <- eval(parse(text = checks$ds_smell$equation[i]))
    }, error = function(e) {
      stop("Problem parsing the equation for smell `", checks$ds_smell$check_name[i], "`.\n", e)
    })

    tryCatch({
      ds_smell_result$value[i]   <- f(ds)
    }, error = function(e) {
      stop("Problem executing the equation for smell `", checks$ds_smell$check_name[i], "`.\n", e)
    })

    # ds_smell_result$smell_value[i]   <- f[[i]](ds)
    ds_smell_result$pass[i]    <- dplyr::between(ds_smell_result$value[i], left = ds_smell_result$bound_lower[i], right = ds_smell_result$bound_upper[i])
  }

  message(nrow(ds_smell_result), " smells have been sniffed  ", sum(!ds_smell_result$pass), " violation(s) were found.\n")

  ds_smell_result |>
    dplyr::select(
      .data$check_name,
      .data$pass,
      tidyselect::everything()
    )
}
