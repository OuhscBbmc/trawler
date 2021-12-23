# load-checks-biochemical

    Code
      checks$ds_smell
    Output
      # A tibble: 12 x 11
         check_name    description       priority active debug bound_lower bound_upper
         <chr>         <chr>                <int> <lgl>  <lgl>       <dbl>       <dbl>
       1 proportion_f~ Proportion femal~        1 TRUE   FALSE        0.5         0.5 
       2 proportion_m~ Proportion male ~        1 TRUE   FALSE        0.5         0.5 
       3 mean_age      Mean age of part~        1 TRUE   FALSE       20          80   
       4 mean_serum_p~ Mean serum pre-a~        1 TRUE   FALSE       32          39   
       5 mean_serum_c~ Mean serum creat~        1 TRUE   FALSE        3          15   
       6 average_bmi_~ Average BMI is b~        1 TRUE   FALSE       18          24   
       7 mean_serum_c~ Average Choleste~        1 TRUE   FALSE      100         140   
       8 dialysis_ade~ Normal range for~        1 TRUE   FALSE        1.2         5   
       9 average_seru~ Mean serum ferri~        1 TRUE   FALSE      501        1200   
      10 nutritional_~ Most patients ag~        1 TRUE   FALSE        0.85        0.99
      11 definitive_d~ A 100 percent of~        1 TRUE   FALSE        1           1   
      12 normalized_p~ Average Normaliz~        1 TRUE   FALSE        0           0.12
      # ... with 4 more variables: bounds_template <chr>, value_template <chr>,
      #   equation <chr>, boundaries <chr>

---

    Code
      checks$ds_smell_inactive
    Output
      # A tibble: 0 x 10
      # ... with 10 variables: check_name <chr>, description <chr>, priority <int>,
      #   active <lgl>, debug <lgl>, bound_lower <dbl>, bound_upper <dbl>,
      #   bounds_template <chr>, value_template <chr>, equation <chr>

---

    Code
      checks$ds_rule
    Output
      # A tibble: 14 x 7
         check_name   error_message   priority active debug instrument  passing_test  
         <chr>        <chr>              <int> <lgl>  <lgl> <chr>       <chr>         
       1 baseline_pr~ Serum pre-albu~        1 TRUE   FALSE baseline_d~ "function ( d~
       2 missing_ser~ Relevant nutri~        1 TRUE   FALSE baseline_d~ "function ( d~
       3 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function ( d~
       4 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function ( d~
       5 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function ( d~
       6 serum_preal~ serum prealbum~        1 TRUE   FALSE baseline_d~ "function ( d~
       7 baseline_fi~ Serum prealbum~        1 TRUE   FALSE baseline_d~ "function ( d~
       8 daily_first~ In-addition to~        1 TRUE   FALSE baseline_d~ "function ( d~
       9 daily_prote~ npcr levels in~        1 TRUE   FALSE baseline_d~ "function ( d~
      10 hospitaliza~ Patient was ho~        1 TRUE   FALSE completion~ "function ( d~
      11 optimal_dai~ Daily protein ~        1 TRUE   FALSE completion~ "function ( d~
      12 recommended~ NPCR values ar~        1 TRUE   FALSE completion~ "function ( d~
      13 npcr         NPCR at comple~        1 TRUE   FALSE completion~ "function ( d~
      14 npcr_compar~ NPCR at comple~        1 TRUE   FALSE completion~ "function ( d~

---

    Code
      checks$ds_rule_inactive
    Output
      # A tibble: 1 x 7
        check_name         error_message priority active debug instrument passing_test
        <chr>              <chr>            <int> <lgl>  <lgl> <chr>      <chr>       
      1 pre_albumin_levels pre_albumin ~        1 FALSE  FALSE visit_lab~ "function (~

