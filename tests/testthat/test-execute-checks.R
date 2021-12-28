library(testthat)

test_that("execute-checks-biochemical", {
  path_data     <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
  path_checks   <- system.file("checks/checks-biochemical.yml", package = "trawler")

  ds_pt_event   <- readr::read_rds(path_data)
  checks        <- load_checks(path_checks)
  result        <- execute_checks(ds_pt_event, checks)

  expect_s3_class(result, class = "trawler_checks")
  expect_snapshot(result$smells)
  expect_snapshot(as.data.frame(result$smells))
  expect_snapshot(result$smell_status)
})

# result$ds_smell_result |>
#   dplyr::group_by(check_name) |>
#   tidyr::nest(
#     result = -check_name
#   )
