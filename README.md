
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trawler

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/trawler)](https://CRAN.R-project.org/package=trawler)
[![Codecov test
coverage](https://codecov.io/gh/OuhscBbmc/trawler/branch/main/graph/badge.svg)](https://app.codecov.io/gh/OuhscBbmc/trawler?branch=main)
<!-- badges: end -->

The goal of trawler is to …

## Installation

You can install the development version of trawler from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("OuhscBbmc/trawler")
```

## Standard Trawler Report

``` r
# Step 0: define paths.
#   So this package example executes on every machine, temp files are used.

# Replace the two paths for your specific project
path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
path_defs    <- system.file("checks/checks-biochemical.yml", package = "trawler")

# In your real code, this will probably in a static directory.
# If PHI or sensitive info is contained, use a secure location.
directory_output <- file.path(tempdir(check = TRUE), "trawler")
if (!dir.exists(directory_output)) dir.create(directory_output)
path_checks <- tempfile("trawler-checks-", fileext = ".rds", tmpdir = directory_output)

# Step 1: load the check definitions and the dataset to test
ds_pt_event  <- readr::read_rds(path_data)
checks       <- trawler::load_checks(path_defs)

# Step 2: execute the checks and save to an rds file
ds_pt_event |>
  trawler::execute_checks(checks, origin = "REDCap") |>
  readr::write_rds(path_checks)

# Step 3: render checks as an html report with R Markdown
trawler::render_rmarkdown(path_checks, directory_output)
#> processing file: report-1.Rmd
#> Loading required namespace: DT
#> output file: report-1.knit.md
#> /usr/lib/rstudio/bin/pandoc/pandoc +RTS -K512m -RTS report-1.knit.md --to html4 --from markdown+autolink_bare_uris+tex_math_single_backslash --output /tmp/Rtmpy5PD2b/trawler/report-1.html --lua-filter /home/wibeasley/R/x86_64-pc-linux-gnu-library/4.1/rmarkdown/rmarkdown/lua/pagebreak.lua --lua-filter /home/wibeasley/R/x86_64-pc-linux-gnu-library/4.1/rmarkdown/rmarkdown/lua/latex-div.lua --self-contained --variable bs3=TRUE --standalone --section-divs --table-of-contents --toc-depth 3 --variable toc_float=1 --variable toc_selectors=h1,h2,h3 --variable toc_collapsed=1 --variable toc_smooth_scroll=1 --variable toc_print=1 --template /home/wibeasley/R/x86_64-pc-linux-gnu-library/4.1/rmarkdown/rmd/h/default.html --no-highlight --variable highlightjs=1 --number-sections --variable theme=bootstrap --include-in-header /tmp/Rtmpy5PD2b/rmarkdown-strb799437a216a.html --mathjax --variable 'mathjax-url:https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
#> 
#> Output created: /tmp/Rtmpy5PD2b/trawler/report-1.html

# For the sake of this example, clean up temp files.
#    You probably do NOT want this line in your real code.
unlink(directory_output, recursive = TRUE)
```

The rendered html report will look similar to [this
preview](https://htmlpreview.github.io/?https://github.com/OuhscBbmc/trawler/blob/main/inst/report-templates/rmarkdown-1/report-1.html).
