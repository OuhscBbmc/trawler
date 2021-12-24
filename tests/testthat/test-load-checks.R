library(testthat)

test_that("load-checks-biochemical", {
  path_checks <- system.file("checks/checks-biochemical.yml", package = "trawler")
  checks <- load_checks(path_checks)

  expect_s3_class(checks, "trawler_checks_definition")
  expect_s3_class(checks$smells, "tbl_df")
  expect_s3_class(checks$rules , "tbl_df")

  expect_snapshot(checks$smells)
  expect_snapshot(as.data.frame(checks$smells))
  expect_snapshot(checks$smells_inactive)

  expect_snapshot(checks$rules)
  expect_snapshot(as.data.frame(checks$rules))
  expect_snapshot(checks$rules_inactive)
})
