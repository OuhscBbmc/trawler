library(testthat)

test_that("execute-checks-biochemical", {
  path_data     <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
  path_checks   <- system.file("checks/checks-biochemical.yml", package = "trawler")

  ds_pt_event   <- readr::read_rds(path_data)
  checks        <- load_checks(path_checks)
  result        <- execute_checks(ds_pt_event, checks)

  expect_snapshot(result$ds_smell_result)
  expect_snapshot(as.data.frame(result$ds_smell_result))
})
