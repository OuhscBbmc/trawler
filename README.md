
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

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# Replace the two paths for your specific project
path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")

ds_pt_event  <- readr::read_rds(path_data)
checks       <- trawler::load_checks(path_checks)

trawler::execute_checks(ds_pt_event, checks)
#> $record_id_name
#> [1] "record_id"
#> 
#> $baseline_date_name
#> [1] "date_enrolled"
#> 
#> $record_id_link
#> [1] "<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v%s/DataEntry/index.php?pid=%s&arm=%s&id=%s&page=%s\" target=\"_blank\">%s</a>"
#> 
#> $github_file_prefix
#> [1] "https://github.com/OuhscBbmc/validator-1/blob/master"
#> 
#> $smells
#> # A tibble: 12 × 12
#>    check_name     pass  description       priority debug bound_lower bound_upper
#>    <chr>          <lgl> <chr>                <int> <lgl>       <dbl>       <dbl>
#>  1 proportion_fe… FALSE Proportion femal…        1 FALSE        0.5         0.5 
#>  2 proportion_ma… FALSE Proportion male …        1 FALSE        0.5         0.5 
#>  3 mean_age       TRUE  Mean age of part…        1 FALSE       20          80   
#>  4 mean_serum_pr… FALSE Mean serum pre-a…        1 FALSE       32          39   
#>  5 mean_serum_cr… FALSE Mean serum creat…        1 FALSE        3          15   
#>  6 average_bmi_a… FALSE Average BMI is b…        1 FALSE       18          24   
#>  7 mean_serum_ch… TRUE  Average Choleste…        1 FALSE      100         140   
#>  8 dialysis_adeq… TRUE  Normal range for…        1 FALSE        1.2         5   
#>  9 average_serum… TRUE  Mean serum ferri…        1 FALSE      501        1200   
#> 10 nutritional_c… TRUE  Most patients ag…        1 FALSE        0.85        0.99
#> 11 definitive_di… TRUE  A 100 percent of…        1 FALSE        1           1   
#> 12 normalized_pr… FALSE Average Normaliz…        1 FALSE        0           0.12
#> # … with 5 more variables: bounds_template <chr>, value_template <chr>,
#> #   equation <chr>, boundaries <chr>, value <dbl>
#> 
#> $smell_status
#> [1] "12 smells have been sniffed.  6 violation(s) were found."
#> 
#> $rules
#> # A tibble: 14 × 7
#>    check_name  error_message   priority debug instrument   passing_test  results
#>    <chr>       <chr>              <int> <lgl> <chr>        <chr>         <list> 
#>  1 baseline_p… Serum pre-albu…        1 FALSE baseline_da… "function (d… <tibbl…
#>  2 missing_se… Relevant nutri…        1 FALSE baseline_da… "function (d… <tibbl…
#>  3 serum_prea… Baseline preal…        1 FALSE baseline_da… "function (d… <tibbl…
#>  4 serum_prea… Baseline preal…        1 FALSE baseline_da… "function (d… <NULL> 
#>  5 serum_prea… Baseline preal…        1 FALSE baseline_da… "function (d… <NULL> 
#>  6 serum_prea… serum prealbum…        1 FALSE baseline_da… "function (d… <NULL> 
#>  7 baseline_f… Serum prealbum…        1 FALSE baseline_da… "function (d… <NULL> 
#>  8 daily_firs… In-addition to…        1 FALSE baseline_da… "function (d… <NULL> 
#>  9 daily_prot… npcr levels in…        1 FALSE baseline_da… "function (d… <NULL> 
#> 10 hospitaliz… Patient was ho…        1 FALSE completion_… "function (d… <tibbl…
#> 11 optimal_da… Daily protein …        1 FALSE completion_… "function (d… <tibbl…
#> 12 recommende… NPCR values ar…        1 FALSE completion_… "function (d… <tibbl…
#> 13 npcr        NPCR at comple…        1 FALSE completion_… "function (d… <tibbl…
#> 14 npcr_compa… NPCR at comple…        1 FALSE completion_… "function (d… <tibbl…
#> 
#> $rule_status
#> [1] "14 rules were examined. 8 rule(s) had at least 1 violation. 47 total violation(s) were found."
#> 
#> attr(,"class")
#> [1] "trawler_checks"
```
