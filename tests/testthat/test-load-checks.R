library(testthat)
# testthat::test_file("tests/testthat/test-load-checks.R")

test_that("load-checks-biochemical", {
  path_checks <- system.file("checks/checks-biochemical.yml", package = "trawler")
  checks <- load_checks(path_checks)

  expect_s3_class(checks, "trawler_checks_definition")
  expect_s3_class(checks$smells, "tbl_df")
  expect_s3_class(checks$rules , "tbl_df")

  # Compare record-level misc values
  expect_snapshot(checks$record_id_name)
  expect_snapshot(checks$baseline_date_name)
  expect_snapshot(checks$record_id_link)
  expect_snapshot(checks$github_file_prefix)
  expect_snapshot(checks$redcap_project_id)
  expect_snapshot(checks$redcap_version)
  expect_snapshot(checks$redcap_default_arm)
  expect_snapshot(checks$redcap_codebook)
  expect_snapshot(checks$redcap_record_link)

  # Compare smells
  expect_snapshot(checks$smells)
  expect_snapshot(as.data.frame(checks$smells))
  expect_snapshot(checks$smells_inactive)
  expect_snapshot(cat(checks$smell_names_md))

  # Compare rules
  expect_snapshot(checks$rules)
  expect_snapshot(as.data.frame(checks$rules))
  expect_snapshot(checks$rules_inactive)
})
