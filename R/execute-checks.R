#' @title Load and parse checks in a yaml file, and return a list
#' of useful objects.
#' @param ds The [data.frame] to be checked.  Required.
#' @param ds_smell The [data.frame] describing the smells to check.  Required.
#'
#' @examples
#' # Replace the paths for your specific project
#' path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
#' path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")
#'
#' ds_pt_event  <- readr::read_rds(path_data)
#' checks       <- load_checks(path_checks)
#'
#' execute_checks(ds_pt_event, checks$ds_smell)
#'
#' @export
execute_checks <- function (ds, ds_smell) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_data_frame(ds_smell)

  ds_smell_result <- execute_smells(ds, ds_smell)

  list(
    ds_smell_result = ds_smell_result
  )

}

execute_smells <- function (ds, ds_smell) {
  checkmate::assert_data_frame(ds)
  checkmate::assert_data_frame(ds_smell)

  # cat(
  #   glue::glue("{nrow(ds_smell)} smells [have been defined]({checks$github_file_prefix}/{path_checks}):\n\n"),
  #   ds_smell |>
  #     glue::glue_data("1. {check_name};"),
  #   sep = "\n"
  # )

  # fs <- ds_smell$equation |>
  #   purrr::invoke_map(function(x) eval(parse(text=x)), .)

  ds_smell_result <-
    ds_smell |>
    dplyr::mutate(
      # f             = purrr::invoke_map(function(x) eval(parse(text=x)), .data$equation),
      smell_value   = NA_real_,
      smell_pass    = NA
    )

  # for( i in 1:14 ) {
  for (i in seq_len(nrow(ds_smell_result))) { # i <- 2L

    if (ds_smell$debug[i]) {
      browser()
    }

    tryCatch({
      f <- eval(parse(text = ds_smell$equation[i]))
    }, error = function(e) {
      stop("Problem parsing the equation for smell `", ds_smell$check_name[i], "`.\n", e)
    })

    tryCatch({
      ds_smell_result$smell_value[i]   <- f(ds)
    }, error = function(e) {
      stop("Problem executing the equation for smell `", ds_smell$check_name[i], "`.\n", e)
    })

    # ds_smell_result$smell_value[i]   <- f[[i]](ds)
    ds_smell_result$smell_pass[i]    <- dplyr::between(ds_smell_result$smell_value[i], left = ds_smell_result$bound_lower[i], right = ds_smell_result$bound_upper[i])
  }

  message(nrow(ds_smell_result), " smells have been sniffed  ", sum(!ds_smell_result$smell_pass), " violation(s) were found.\n")

  ds_smell_result
}
