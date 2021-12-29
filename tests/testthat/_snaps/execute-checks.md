# execute-checks-biochemical

    Code
      result$smells
    Output
      # A tibble: 12 x 12
         check_name     pass  description       priority debug bound_lower bound_upper
         <chr>          <lgl> <chr>                <int> <lgl>       <dbl>       <dbl>
       1 proportion_fe~ FALSE Proportion femal~        1 FALSE        0.5         0.5 
       2 proportion_ma~ FALSE Proportion male ~        1 FALSE        0.5         0.5 
       3 mean_age       TRUE  Mean age of part~        1 FALSE       20          80   
       4 mean_serum_pr~ FALSE Mean serum pre-a~        1 FALSE       32          39   
       5 mean_serum_cr~ FALSE Mean serum creat~        1 FALSE        3          15   
       6 average_bmi_a~ FALSE Average BMI is b~        1 FALSE       18          24   
       7 mean_serum_ch~ TRUE  Average Choleste~        1 FALSE      100         140   
       8 dialysis_adeq~ TRUE  Normal range for~        1 FALSE        1.2         5   
       9 average_serum~ TRUE  Mean serum ferri~        1 FALSE      501        1200   
      10 nutritional_c~ TRUE  Most patients ag~        1 FALSE        0.85        0.99
      11 definitive_di~ TRUE  A 100 percent of~        1 FALSE        1           1   
      12 normalized_pr~ FALSE Average Normaliz~        1 FALSE        0           0.12
      # ... with 5 more variables: bounds_template <chr>, value_template <chr>,
      #   equation <chr>, boundaries <chr>, value <dbl>

---

    Code
      as.data.frame(result$smells)
    Output
                                        check_name  pass
      1             proportion_female_participants FALSE
      2               proportion_male_participants FALSE
      3                                   mean_age  TRUE
      4    mean_serum_prealbumin_level_at_baseline FALSE
      5    mean_serum_creatinine_level_at_baseline FALSE
      6                    average_bmi_at_baseline FALSE
      7  mean_serum_cholesterol_levels_at_baseline  TRUE
      8                          dialysis_adequacy  TRUE
      9  average_serum_ferritin_levels_at_baseline  TRUE
      10                    nutritional_counseling  TRUE
      11                      definitive_diagnosis  TRUE
      12         normalized_protein_catabolic_rate FALSE
                                                                                                        description
      1                               Proportion female participants is half the participants till study conclusion
      2                                 Proportion male participants is half the participants till study conclusion
      3                                                    Mean age of participants is between 18 years to 20 years
      4                                   Mean serum pre-albumin levels at baseline are between 31mg/dl and 39mg/dl
      5                                     Mean serum creatinine levels at baseline are between 3mg/dl and 15mg/dl
      6                                                                            Average BMI is between 18 and 24
      7                             Average Cholesterol levels range is between 100mg/dl-140mg/dl at baseline level
      8                                                          Normal range for Kt/V values are between 1.2 and 5
      9                             Mean serum ferritin levels are in the recommended range of > 500ng/dl-1200ng/dl
      10                                                   Most patients agreed to receiving nutritional counseling
      11 A 100 percent of study participants were diagnosed with malnutrition associated with Chronic Renal Disease
      12                                                 Average Normalized Protein Catabolic Rate is < 1.2g/kg/day
         priority debug bound_lower bound_upper bounds_template value_template
      1         1 FALSE        0.50        0.50    [%.2f, %.2f]           %.4f
      2         1 FALSE        0.50        0.50    [%.2f, %.2f]           %.4f
      3         1 FALSE       20.00       80.00    [%.2f, %.2f]           %.4f
      4         1 FALSE       32.00       39.00    [%.2f, %.2f]           %.4f
      5         1 FALSE        3.00       15.00    [%.2f, %.2f]           %.4f
      6         1 FALSE       18.00       24.00    [%.2f, %.2f]           %.4f
      7         1 FALSE      100.00      140.00    [%.2f, %.2f]           %.4f
      8         1 FALSE        1.20        5.00    [%.2f, %.2f]           %.4f
      9         1 FALSE      501.00     1200.00    [%.0f, %.0f]           %.2f
      10        1 FALSE        0.85        0.99    [%.2f, %.2f]           %.4f
      11        1 FALSE        1.00        1.00    [%.2f, %.2f]           %.4f
      12        1 FALSE        0.00        0.12    [%.2f, %.2f]           %.4f
                                                                                   equation
      1                             function (d) {\n  mean(d$sex == "female", na.rm=T)\n}\n
      2                               function (d) {\n  mean(d$sex == "male", na.rm=T)\n}\n
      3                                         function (d) {\n  mean(d$age, na.rm=T)\n}\n
      4                   function (d) {\n  mean(d$baseline_prealbumin_level, na.rm=T)\n}\n
      5                   function (d) {\n  mean(d$baseline_creatinine_level, na.rm=T)\n}\n
      6                                function (d) {\n  mean(d$baseline_bmi, na.rm=T)\n}\n
      7                        function (d) {\n  mean(d$baseline_cholesterol, na.rm=T)\n}\n
      8  function (d) {\n  mean(d$completion_project_questionnaire_ktv_value, na.rm=T)\n}\n
      9                     function (d) {\n  mean(d$baseline_ferritin_level, na.rm=T)\n}\n
      10                     function (d) {\n  mean(d$nutritional_counseling, na.rm=T)\n}\n
      11        function (d) {\n  mean(d$differential_diagnoses_malnutrition, na.rm=T)\n}\n
      12 function (d) {\n  mean(d$baseline_normalized_protein_catabolic_rate, na.rm=T)\n}\n
               boundaries       value
      1      [0.50, 0.50]   0.4444444
      2      [0.50, 0.50]   0.5555556
      3    [20.00, 80.00]  44.3888889
      4    [32.00, 39.00]  23.6666667
      5     [3.00, 15.00]  23.1687500
      6    [18.00, 24.00]  24.8500000
      7  [100.00, 140.00] 134.1176471
      8      [1.20, 5.00]   1.9166667
      9       [501, 1200] 589.1176471
      10     [0.85, 0.99]   0.8888889
      11     [1.00, 1.00]   1.0000000
      12     [0.00, 0.12]   0.9312500

---

    Code
      result$smell_status
    Output
      [1] "12 smells have been sniffed.  6 violation(s) were found."

---

    Code
      result$rule_results
    Output
      # A tibble: 47 x 7
         check_name   record_id data_collector error_message       priority instrument
         <chr>            <int>          <int> <chr>                  <int> <chr>     
       1 baseline_pr~         1              1 Serum pre-albumin ~        1 baseline_~
       2 baseline_pr~         2              2 Serum pre-albumin ~        1 baseline_~
       3 baseline_pr~         3              3 Serum pre-albumin ~        1 baseline_~
       4 baseline_pr~         8              1 Serum pre-albumin ~        1 baseline_~
       5 baseline_pr~         9              3 Serum pre-albumin ~        1 baseline_~
       6 baseline_pr~        12              3 Serum pre-albumin ~        1 baseline_~
       7 baseline_pr~        13              1 Serum pre-albumin ~        1 baseline_~
       8 baseline_pr~        14              1 Serum pre-albumin ~        1 baseline_~
       9 baseline_pr~        15              3 Serum pre-albumin ~        1 baseline_~
      10 baseline_pr~        16              2 Serum pre-albumin ~        1 baseline_~
      # ... with 37 more rows, and 1 more variable: consent_date <date>

