#' @title Render (executed) checks to an html document with [R Markdown](https://rmarkdown.rstudio.com/)
#' @param path_checks The file path of the output of
#' [trawler::execute_checks()].  Required.
#' @param directory_output A writable directory to save the report outputs.
#' The html file is the primary output.  The markdown file is sometimes
#' useful too.  Required.
#' @param report_file_name The name of the resulting html file.
#' Defaults to "trawler.html".
#' @param path_template The
#' [rmd file](https://rmarkdown.rstudio.com/articles_intro.html),
#' which serves as the report template.  Defaults to the
#' [standard template](https://github.com/OuhscBbmc/trawler/tree/main/inst/report-templates/rmarkdown-1/report-1.Rmd)
#' built into the trawler package.
#'
#' @examples
#' # Step 0: define paths.
#' #   So this package example executes on every machine, temp files are used.
#'
#' # Replace the two paths for your specific project
#' path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
#' path_defs    <- system.file("checks/checks-biochemical.yml", package = "trawler")
#'
#' # In your real code, this will probably in a static directory.
#' # If PHI or sensitive info is contained, use a secure location.
#' directory_output <- file.path(tempdir(check = TRUE), "trawler")
#' if (!dir.exists(directory_output)) dir.create(directory_output)
#' path_checks <- tempfile("trawler-checks-", fileext = ".rds", tmpdir = directory_output)
#'
#' # Step 1: load the check definitions and the dataset to test
#' ds_pt_event  <- readr::read_rds(path_data)
#' checks       <- load_checks(path_defs, origin = "REDCap")
#'
#' # Step 2: execute the checks and save to an rds file
#' ds_pt_event |>
#'   execute_checks(checks, origin = "REDCap") |>
#'   readr::write_rds(path_checks)
#'
#' # Step 3: render checks as an html report with R Markdown
#' render_rmarkdown(path_checks, directory_output)
#'
#' # For the sake of this example, clean up temp files.
#' #    You probably do NOT want this line in your real code.
#' unlink(directory_output, recursive = TRUE)
#'
#' @export
render_rmarkdown <- function(
  path_checks,
  directory_output,
  report_file_name = "trawler.html",
  path_template = system.file("report-templates/rmarkdown-1/report-1.Rmd", package = "trawler")
) {
  checkmate::assert_file_exists(path_checks)

  rmarkdown::render(
    input       = path_template,
    params      = list(path_checks = path_checks),
    output_dir  = directory_output,
    output_file = report_file_name
  )
}
