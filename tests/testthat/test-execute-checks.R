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

  expect_snapshot(result$rules)
  result$rules |>
    dplyr::select(
      !tidyselect::contains("results")
    ) |>
    as.data.frame() |>
    expect_snapshot()

  ds_result_unnested <-
    result$rules |>
    dplyr::select(
      check_name,
      results,
    ) |>
    tidyr::unnest(results)

  expect_snapshot(ds_result_unnested)
  expect_snapshot(as.data.frame(ds_result_unnested))
})


# result$ds_smell_result |>
#   dplyr::group_by(check_name) |>
#   tidyr::nest(
#     result = -check_name
#   )
