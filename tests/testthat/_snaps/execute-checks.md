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
      result$rules
    Output
      # A tibble: 14 x 7
         check_name  error_message   priority debug instrument   passing_test  results
         <chr>       <chr>              <int> <lgl> <chr>        <chr>         <list> 
       1 baseline_p~ Serum pre-albu~        1 FALSE baseline_da~ "function (d~ <tibbl~
       2 missing_se~ Relevant nutri~        1 FALSE baseline_da~ "function (d~ <tibbl~
       3 serum_prea~ Baseline preal~        1 FALSE baseline_da~ "function (d~ <tibbl~
       4 serum_prea~ Baseline preal~        1 FALSE baseline_da~ "function (d~ <NULL> 
       5 serum_prea~ Baseline preal~        1 FALSE baseline_da~ "function (d~ <NULL> 
       6 serum_prea~ serum prealbum~        1 FALSE baseline_da~ "function (d~ <NULL> 
       7 baseline_f~ Serum prealbum~        1 FALSE baseline_da~ "function (d~ <NULL> 
       8 daily_firs~ In-addition to~        1 FALSE baseline_da~ "function (d~ <NULL> 
       9 daily_prot~ npcr levels in~        1 FALSE baseline_da~ "function (d~ <NULL> 
      10 hospitaliz~ Patient was ho~        1 FALSE completion_~ "function (d~ <tibbl~
      11 optimal_da~ Daily protein ~        1 FALSE completion_~ "function (d~ <tibbl~
      12 recommende~ NPCR values ar~        1 FALSE completion_~ "function (d~ <tibbl~
      13 npcr        NPCR at comple~        1 FALSE completion_~ "function (d~ <tibbl~
      14 npcr_compa~ NPCR at comple~        1 FALSE completion_~ "function (d~ <tibbl~

---

    Code
      as.data.frame(dplyr::select(result$rules, !tidyselect::contains("results")))
    Output
                                          check_name
      1                   baseline_prealbumin_levels
      2                  missing_serum_marker_levels
      3                    serum_prealbumin_levels_1
      4                    serum_prealbumin_levels_2
      5      serum_prealbumin_levels_completion_data
      6         serum_prealbumin_levels_expectations
      7          baseline_first_visit_lab_parameters
      8  daily_first_visit_lab_and_workup_parameters
      9                         daily_protein_intake
      10                      hospitalization_reason
      11                optimal_daily_protein_intake
      12                      recommended_npcr_range
      13                                        npcr
      14                             npcr_comparison
                                                                                                                                 error_message
      1                                                       Serum pre-albumin level of all enrolled patients do not meet the study criterion
      2                                                                                         Relevant nutritional serum markers are missing
      3                         Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit
      4  Baseline prealbumin levels and pre-albumin levels during the 1st visit are not missing however levels in the next reading are missing
      5                                  Baseline prealbumin levels are not missing however readings are not carefully monitored at completion
      6                                           serum prealbumin levels are not missing however subsequent readings did not come as expected
      7                                                    Serum prealbumin levels are low and protein intake at baseline is less than optimal
      8                                         In-addition to baseline & visit lab protein parameters, blood work-up npcr levels are also low
      9                                                                                     npcr levels in study have not improved as intended
      10                                                        Patient was hospitalized but reason and the date of hospitalization is missing
      11                                      Daily protein intake is optimal but one of the nutritional marker is not within the normal range
      12                                                                        NPCR values are not within the recommended range at completion
      13                                                                                                         NPCR at completion is missing
      14                                                                               NPCR at completion is not greater than npcr at baseline
         priority debug
      1         1 FALSE
      2         1 FALSE
      3         1 FALSE
      4         1 FALSE
      5         1 FALSE
      6         1 FALSE
      7         1 FALSE
      8         1 FALSE
      9         1 FALSE
      10        1 FALSE
      11        1 FALSE
      12        1 FALSE
      13        1 FALSE
      14        1 FALSE
                                                                 instrument
      1                                                       baseline_data
      2                                                       baseline_data
      3                                       baseline_data, visit_lab_date
      4                   baseline_data, visit_lab_date, visit_blood_workup
      5  baseline_data, visit_lab_date, visit_blood_workup, completion_date
      6  baseline_data, visit_lab_date, visit_blood_workup, completion_date
      7                                       baseline_data, visit_lab_data
      8                         baseline_data, patient_morale_questionnaire
      9                         baseline_data, patient_morale_questionnaire
      10                                   completion_project_questionnaire
      11                  completion_project_questionnaire, completion_data
      12                                                    completion_data
      13                                                    completion_data
      14                                                    completion_data
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              passing_test
      1                                                                                                                                                                                                                                                                                                                                           function (d) {\n  ifelse(\n    !is.na(d$date_enrolled),\n    (30 < d$baseline_prealbumin_level &  d$baseline_prealbumin_level < 40),\n    TRUE\n  )\n}\n
      2                                                                                                                                                                                                                                                                                                 function (d) {\n  ifelse(\n    !is.na(d$date_enrolled),\n    !is.na(d$baseline_prealbumin_level) & !is.na(d$baseline_creatinine_level) & !is.na(d$baseline_transferrin_level),\n    TRUE\n  )\n}\n
      3                                                                                                                                                                                                                                                         function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check & !is.na(d$baseline_prealbumin_level),\n    !is.na(d$visit_lab_prealbumin_level),\n    TRUE\n  )\n}\n
      4                                                                                                                                                                                                            function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check & !is.na(d$baseline_prealbumin_level) & !is.na(d$visit_lab_prealbumin_level),\n    !is.na(d$visit_blood_workup_prealbumin_level),\n    TRUE\n  )\n}\n
      5                                                                                                                                     function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check & !is.na(d$baseline_prealbumin_level) & !is.na(d$visit_lab_prealbumin_level)\n    & !is.na(d$visit_blood_workup_prealbumin_level),\n    !is.na(d$completion_data_prealbumin_level),\n    TRUE\n  )\n}\n
      6                                                               function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check & !is.na(d$baseline_prealbumin_level) & !is.na(d$visit_lab_prealbumin_level) &\n    !is.na(d$visit_blood_workup_prealbumin_level) & !is.na(d$completion_data_prealbumin_level),\n    (d$completion_data_prealbumin_level > d$visit_lab_prealbumin_level),\n    TRUE\n  )\n}\n
      7                                                                                                                                                              function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  ifelse(\n      d$redcap_event_name %in% events_to_check &\n    (d$baseline_prealbumin_level < 30) & (d$baseline_normalized_protein_catabolic_rate < 1.2),\n    (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr),\n    TRUE\n  )\n}\n
      8                                                                                                         function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check &\n    (d$baseline_prealbumin_level < 30) & (d$baseline_normalized_protein_catabolic_rate < 1.2) &\n    (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr),\n    (d$visit_lab_npcr <= d$visit_blood_workup_npcr),\n    TRUE\n  )\n}\n
      9        function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  ifelse(\n    d$redcap_event_name %in% events_to_check &\n    (d$baseline_prealbumin_level < 30) & (d$baseline_normalized_protein_catabolic_rate < 1.2) &\n    (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr) &\n    (d$visit_lab_npcr <= d$visit_blood_workup_npcr),\n    (d$visit_blood_workup_npcr< d$completion_data_npcr),\n    TRUE\n  )\n}\n
      10                                                                                                                                                                                                                                            function (d) {\n  ifelse(\n    d$completion_project_questionnaire_hospitalization %in% 1,\n    !is.na(d$completion_project_questionnaire_hospitalization_cause) & !is.na(d$completion_project_questionnaire_hospitalization_date),\n    TRUE\n  )\n}\n
      11                                                                                                                                                                                                                                                                                                                         function (d) {\n  ifelse(\n    d$completion_data_npcr >= 1.2,\n    d$completion_data_prealbumin_level > 30 & d$completion_data_prealbumin_level < 40,\n    TRUE\n  )\n}\n
      12                                                                                                                                                                                                                                                                                                                                                                                                         function (d) {\n    ( 1.4 <= d$completion_data_npcr | d$completion_data_npcr >= 1.2)\n}\n
      13 function (d) {\n  events_to_check <- c("final_visit_arm_1")\n  dplyr::if_else(\n    d$redcap_event_name %in% events_to_check,\n    !is.na(d$completion_data_npcr),                                                                # If this row exists in the desired event, then check for nonmissingness.\n    TRUE                                                                                           # Otherwise, the test passes for rows associated with all other events.\n  )\n}\n
      14                                                                                                                                                                                                                                                                                                                                                                    function (d) {\n  ifelse(\n  !is.na(d$completion_data_npcr),\n  (d$npcr_at_baseline < d$completion_data_npcr),\n  TRUE\n  )\n}

---

    Code
      ds_result_unnested
    Output
      # A tibble: 47 x 4
         check_name                 record_id data_collector baseline_date
         <chr>                          <int>          <int> <date>       
       1 baseline_prealbumin_levels         1              1 2015-01-02   
       2 baseline_prealbumin_levels         2              2 2015-01-02   
       3 baseline_prealbumin_levels         3              3 2015-01-05   
       4 baseline_prealbumin_levels         8              1 2015-02-03   
       5 baseline_prealbumin_levels         9              3 2015-02-08   
       6 baseline_prealbumin_levels        12              3 2015-03-06   
       7 baseline_prealbumin_levels        13              1 2015-03-15   
       8 baseline_prealbumin_levels        14              1 2015-03-10   
       9 baseline_prealbumin_levels        15              3 2015-03-03   
      10 baseline_prealbumin_levels        16              2 2015-03-09   
      # ... with 37 more rows

---

    Code
      as.data.frame(ds_result_unnested)
    Output
                           check_name record_id data_collector baseline_date
      1    baseline_prealbumin_levels         1              1    2015-01-02
      2    baseline_prealbumin_levels         2              2    2015-01-02
      3    baseline_prealbumin_levels         3              3    2015-01-05
      4    baseline_prealbumin_levels         8              1    2015-02-03
      5    baseline_prealbumin_levels         9              3    2015-02-08
      6    baseline_prealbumin_levels        12              3    2015-03-06
      7    baseline_prealbumin_levels        13              1    2015-03-15
      8    baseline_prealbumin_levels        14              1    2015-03-10
      9    baseline_prealbumin_levels        15              3    2015-03-03
      10   baseline_prealbumin_levels        16              2    2015-03-09
      11   baseline_prealbumin_levels       100              1    2015-04-02
      12   baseline_prealbumin_levels       220              1    2015-04-02
      13  missing_serum_marker_levels         7              2    2015-01-27
      14  missing_serum_marker_levels        10            255    2015-02-13
      15  missing_serum_marker_levels        11              2    2015-02-19
      16    serum_prealbumin_levels_1         1              1    2015-01-02
      17    serum_prealbumin_levels_1         2              2    2015-01-02
      18    serum_prealbumin_levels_1         3              3    2015-01-05
      19    serum_prealbumin_levels_1         4            255    2015-01-10
      20    serum_prealbumin_levels_1         5              1    2015-01-13
      21    serum_prealbumin_levels_1         6              3    2015-01-16
      22    serum_prealbumin_levels_1         8              1    2015-02-03
      23    serum_prealbumin_levels_1         9              3    2015-02-08
      24    serum_prealbumin_levels_1        12              3    2015-03-06
      25    serum_prealbumin_levels_1        13              1    2015-03-15
      26    serum_prealbumin_levels_1        14              1    2015-03-10
      27    serum_prealbumin_levels_1        15              3    2015-03-03
      28    serum_prealbumin_levels_1        16              2    2015-03-09
      29    serum_prealbumin_levels_1       100              1    2015-04-02
      30    serum_prealbumin_levels_1       220              1    2015-04-02
      31       hospitalization_reason         8             NA          <NA>
      32       hospitalization_reason        14             NA          <NA>
      33 optimal_daily_protein_intake         3             NA          <NA>
      34 optimal_daily_protein_intake         5             NA          <NA>
      35 optimal_daily_protein_intake         6             NA          <NA>
      36 optimal_daily_protein_intake         7             NA          <NA>
      37 optimal_daily_protein_intake         8             NA          <NA>
      38 optimal_daily_protein_intake         9             NA          <NA>
      39 optimal_daily_protein_intake        11             NA          <NA>
      40 optimal_daily_protein_intake        15             NA          <NA>
      41 optimal_daily_protein_intake        16             NA          <NA>
      42 optimal_daily_protein_intake       100             NA          <NA>
      43       recommended_npcr_range         1             NA          <NA>
      44       recommended_npcr_range        12             NA          <NA>
      45                         npcr        10             NA          <NA>
      46              npcr_comparison         1             NA          <NA>
      47              npcr_comparison        12             NA          <NA>

---

    Code
      result$rule_status
    Output
      [1] "14 rules were examined. 8 rule(s) had at least 1 violation. 47 total violation(s) were found."

