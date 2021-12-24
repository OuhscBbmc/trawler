library(testthat)

test_that("load-checks-biochemical", {
  path_checks <- system.file("checks/checks-biochemical.yml", package = "trawler")
  checks <- load_checks(path_checks)

  expect_s3_class(checks, "trawler_checks_definition")
  expect_s3_class(checks$ds_smell, "tbl_df")
  expect_s3_class(checks$ds_rule , "tbl_df")

  expect_snapshot(checks$ds_smell)
  expect_snapshot(as.data.frame(checks$ds_smell))
  expect_snapshot(checks$ds_smell_inactive)

  expect_snapshot(checks$ds_rule)
  expect_snapshot(as.data.frame(checks$ds_rule))
  expect_snapshot(checks$ds_rule_inactive)
})
