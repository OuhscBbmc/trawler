
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
#>  1 proportion_fe… TRUE  Proportion femal…        2 FALSE        0.25        0.75
#>  2 proportion_ma… TRUE  Proportion male …        2 FALSE        0.25        0.75
#>  3 mean_age       TRUE  Mean age of part…        2 FALSE       20          80   
#>  4 mean_serum_pr… FALSE Mean serum pre-a…        1 FALSE       32          39   
#>  5 mean_serum_cr… FALSE Mean serum creat…        1 FALSE        3          15   
#>  6 average_bmi_a… FALSE Average BMI is b…        2 FALSE       18          24   
#>  7 mean_serum_ch… TRUE  Average Choleste…        1 FALSE      100         140   
#>  8 dialysis_adeq… TRUE  Normal range for…        1 FALSE        1.2         5   
#>  9 average_serum… TRUE  Mean serum ferri…        1 FALSE      501        1200   
#> 10 nutritional_c… TRUE  Most patients ag…        2 FALSE        0.85        0.99
#> 11 definitive_di… TRUE  All study partic…        1 FALSE        1           1   
#> 12 normalized_pr… FALSE Average Normaliz…        1 FALSE        0           0.12
#> # … with 5 more variables: bounds_template <chr>, value_template <chr>,
#> #   equation <chr>, boundaries <chr>, value <dbl>
#> 
#> $smell_status
#> [1] "12 smells have been sniffed.  4 violation(s) were found."
#> 
#> $rules
#> # A tibble: 14 × 8
#>    check_name    violation_count error_message     priority debug instrument    
#>    <chr>                   <int> <chr>                <int> <lgl> <chr>         
#>  1 baseline_pre…              10 Serum pre-albumi…        1 FALSE baseline_data 
#>  2 missing_seru…               3 Relevant nutriti…        1 FALSE baseline_data 
#>  3 serum_prealb…              15 Baseline prealbu…        1 FALSE baseline_data…
#>  4 serum_prealb…               0 Baseline prealbu…        1 FALSE baseline_data…
#>  5 serum_prealb…               0 Baseline prealbu…        1 FALSE baseline_data…
#>  6 serum_prealb…               0 serum prealbumin…        1 FALSE baseline_data…
#>  7 baseline_fir…               0 Serum prealbumin…        1 FALSE baseline_data…
#>  8 daily_first_…               0 In-addition to b…        1 FALSE baseline_data…
#>  9 daily_protei…               0 npcr levels in s…        1 FALSE baseline_data…
#> 10 hospitalizat…               2 Patient was hosp…        1 FALSE completion_pr…
#> 11 optimal_dail…               7 Daily protein in…        1 FALSE completion_pr…
#> 12 recommended_…              10 NPCR values are …        1 FALSE completion_da…
#> 13 npcr                        1 NPCR at completi…        1 FALSE completion_da…
#> 14 npcr_compari…               2 NPCR at completi…        1 FALSE completion_da…
#> # … with 2 more variables: passing_test <chr>, results <list>
#> 
#> $rule_status
#> [1] "14 rules were examined. 8 rule(s) had at least 1 violation. 50 total violation(s) were found."
#> 
#> attr(,"class")
#> [1] "trawler_checks"
```
