library(testthat)

test_that("load-checks-biochemical", {
  path_checks <- system.file("checks/checks-biochemical.yml", package = "trawler")
  checks <- load_checks(path_checks)

  expect_snapshot(checks$ds_smell)
  expect_snapshot(checks$ds_smell_inactive)

  expect_snapshot(checks$ds_rule)
  expect_snapshot(checks$ds_rule_inactive)
})
