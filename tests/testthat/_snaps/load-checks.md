# load-checks-biochemical

    Code
      checks$ds_smell
    Output
      # A tibble: 12 x 11
         check_name  description   priority smell_active debug bound_lower bound_upper
         <chr>       <chr>            <int> <lgl>        <lgl>       <dbl>       <dbl>
       1 proportion~ Proportion f~        1 TRUE         FALSE        0.5         0.5 
       2 proportion~ Proportion m~        1 TRUE         FALSE        0.5         0.5 
       3 mean_age    Mean age of ~        1 TRUE         FALSE       20          80   
       4 mean_serum~ Mean serum p~        1 TRUE         FALSE       32          39   
       5 mean_serum~ Mean serum c~        1 TRUE         FALSE        3          15   
       6 average_bm~ Average BMI ~        1 TRUE         FALSE       18          24   
       7 mean_serum~ Average Chol~        1 TRUE         FALSE      100         140   
       8 dialysis_a~ Normal range~        1 TRUE         FALSE        1.2         5   
       9 average_se~ Mean serum f~        1 TRUE         FALSE      501        1200   
      10 nutritiona~ Most patient~        1 TRUE         FALSE        0.85        0.99
      11 definitive~ A 100 percen~        1 TRUE         FALSE        1           1   
      12 normalized~ Average Norm~        1 TRUE         FALSE        0           0.12
      # ... with 4 more variables: bounds_template <chr>, value_template <chr>,
      #   equation <chr>, boundaries <chr>

---

    Code
      checks$ds_smell_inactive
    Output
      # A tibble: 0 x 10
      # ... with 10 variables: check_name <chr>, description <chr>, priority <int>,
      #   smell_active <lgl>, debug <lgl>, bound_lower <dbl>, bound_upper <dbl>,
      #   bounds_template <chr>, value_template <chr>, equation <chr>

---

    Code
      checks$ds_rule
    Output
      # A tibble: 14 x 7
         check_name  error_message  priority test_active debug instrument passing_test
         <chr>       <chr>             <int> <lgl>       <lgl> <chr>      <chr>       
       1 baseline_p~ Serum pre-alb~        1 TRUE        FALSE baseline_~ "function (~
       2 missing_se~ Relevant nutr~        1 TRUE        FALSE baseline_~ "function (~
       3 serum_prea~ Baseline prea~        1 TRUE        FALSE baseline_~ "function (~
       4 serum_prea~ Baseline prea~        1 TRUE        FALSE baseline_~ "function (~
       5 serum_prea~ Baseline prea~        1 TRUE        FALSE baseline_~ "function (~
       6 serum_prea~ serum prealbu~        1 TRUE        FALSE baseline_~ "function (~
       7 baseline_f~ Serum prealbu~        1 TRUE        FALSE baseline_~ "function (~
       8 daily_firs~ In-addition t~        1 TRUE        FALSE baseline_~ "function (~
       9 daily_prot~ npcr levels i~        1 TRUE        FALSE baseline_~ "function (~
      10 hospitaliz~ Patient was h~        1 TRUE        FALSE completio~ "function (~
      11 optimal_da~ Daily protein~        1 TRUE        FALSE completio~ "function (~
      12 recommende~ NPCR values a~        1 TRUE        FALSE completio~ "function (~
      13 npcr        NPCR at compl~        1 TRUE        FALSE completio~ "function (~
      14 npcr_compa~ NPCR at compl~        1 TRUE        FALSE completio~ "function (~

---

    Code
      checks$ds_rule_inactive
    Output
      # A tibble: 1 x 7
        check_name  error_message  priority test_active debug instrument passing_test 
        <chr>       <chr>             <int> <lgl>       <lgl> <chr>      <chr>        
      1 pre_albumi~ pre_albumin l~        1 FALSE       FALSE visit_lab~ "function ( ~

