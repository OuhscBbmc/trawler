# execute-checks-biochemical

    Code
      checks$record_id_name
    Output
      [1] "record_id"

---

    Code
      checks$baseline_date_name
    Output
      [1] "date_enrolled"

---

    Code
      checks$record_id_link
    Output
      [1] "<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v%s/DataEntry/index.php?pid=%s&arm=%s&id=%s&page=%s\" target=\"_blank\">%s</a>"

---

    Code
      checks$github_file_prefix
    Output
      [1] "https://github.com/OuhscBbmc/validator-1/tree/main"

---

    Code
      checks$redcap_project_id
    Output
      [1] 1612

---

    Code
      checks$redcap_version
    Output
      [1] "10.5.1"

---

    Code
      checks$redcap_default_arm
    Output
      [1] 1

---

    Code
      checks$redcap_codebook
    Output
      [1] "https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/Design/data_dictionary_codebook.php?pid=1612"

---

    Code
      checks$redcap_record_link
    Output
      [1] "<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v%s/DataEntry/index.php?pid=%s&arm=%s&id=%s&page=%s\" target=\"_blank\">%s</a>"

---

    Code
      result$smells
    Output
      # A tibble: 11 x 12
         check_name           pass  description priority debug bound_lower bound_upper
         <chr>                <lgl> <chr>          <int> <lgl>       <dbl>       <dbl>
       1 females              TRUE  Proportion~        2 FALSE        0.4         0.6 
       2 males                TRUE  Proportion~        2 FALSE        0.4         0.6 
       3 age                  TRUE  Mean parti~        2 FALSE       20          60   
       4 serum_prealbumin_le~ FALSE Mean serum~        2 FALSE       32          39   
       5 serum_creatinine_le~ FALSE Mean serum~        2 FALSE        3          15   
       6 bmi_at_baseline      FALSE Mean BMI i~        2 FALSE       18          24   
       7 serum_cholesterol_l~ TRUE  Mean chole~        1 FALSE      100         140   
       8 dialysis_adequacy    TRUE  Mean Kt/V ~        1 FALSE        1.2         5   
       9 nutritional_counsel~ TRUE  Most patie~        2 FALSE        0.85        0.99
      10 definitive_diagnosis TRUE  The propor~        1 FALSE        1           1   
      11 normalized_protein_~ TRUE  Mean Norma~        1 FALSE        0           1.2 
      # i 5 more variables: bounds_template <chr>, value_template <chr>,
      #   equation <chr>, boundaries <chr>, value <dbl>

---

    Code
      as.data.frame(result$smells)
    Output
                                   check_name  pass
      1                               females  TRUE
      2                                 males  TRUE
      3                                   age  TRUE
      4    serum_prealbumin_level_at_baseline FALSE
      5    serum_creatinine_level_at_baseline FALSE
      6                       bmi_at_baseline FALSE
      7  serum_cholesterol_levels_at_baseline  TRUE
      8                     dialysis_adequacy  TRUE
      9                nutritional_counseling  TRUE
      10                 definitive_diagnosis  TRUE
      11    normalized_protein_catabolic_rate  TRUE
                                                                                                                              description
      1                                                                        Proportion of female participants is about half the sample
      2                                                                          Proportion of male participants is about half the sample
      3                                                                                   Mean participant age is between 20 and 60 years
      4                                                           Mean serum pre-albumin level is between 31mg/dl and 39mg/dl at baseline
      5                                                             Mean serum creatinine level is between 3mg/dl and 15mg/dl at baseline
      6                                                                                                     Mean BMI is between 18 and 24
      7                                                             Mean cholesterol levels range is between 100 and 140mg/dl at baseline
      8                                                            Mean Kt/V value is within the normal range (*i.e.*, between 1.2 and 5)
      9                                                                          Most patients agreed to receiving nutritional counseling
      10 The proportion of study participants diagnosed with malnutrition associated with Chronic Renal Disease is 1.0 (*i.e.*, everyone)
      11                                                                  Mean Normalized Protein Catabolic Rate (nPCR) is <= 1.2g/kg/day
         priority debug bound_lower bound_upper bounds_template value_template
      1         2 FALSE        0.40        0.60    [%.2f, %.2f]           %.3f
      2         2 FALSE        0.40        0.60    [%.2f, %.2f]           %.3f
      3         2 FALSE       20.00       60.00    [%.0f, %.0f]           %.1f
      4         2 FALSE       32.00       39.00    [%.0f, %.0f]           %.1f
      5         2 FALSE        3.00       15.00    [%.0f, %.0f]           %.1f
      6         2 FALSE       18.00       24.00    [%.0f, %.0f]           %.1f
      7         1 FALSE      100.00      140.00    [%.0f, %.0f]           %.1f
      8         1 FALSE        1.20        5.00    [%.1f, %.1f]           %.2f
      9         2 FALSE        0.85        0.99    [%.2f, %.2f]           %.3f
      10        1 FALSE        1.00        1.00    [%.1f, %.1f]           %.2f
      11        1 FALSE        0.00        1.20    [%.1f, %.1f]           %.3f
                                                                                        equation
      1                             function (d) {\n  mean(d$sex == "female", na.rm = TRUE)\n}\n
      2                               function (d) {\n  mean(d$sex == "male", na.rm = TRUE)\n}\n
      3                                         function (d) {\n  mean(d$age, na.rm = TRUE)\n}\n
      4                   function (d) {\n  mean(d$baseline_prealbumin_level, na.rm = TRUE)\n}\n
      5                   function (d) {\n  mean(d$baseline_creatinine_level, na.rm = TRUE)\n}\n
      6                                function (d) {\n  mean(d$baseline_bmi, na.rm = TRUE)\n}\n
      7                        function (d) {\n  mean(d$baseline_cholesterol, na.rm = TRUE)\n}\n
      8  function (d) {\n  mean(d$completion_project_questionnaire_ktv_value, na.rm = TRUE)\n}\n
      9                      function (d) {\n  mean(d$nutritional_counseling, na.rm = TRUE)\n}\n
      10        function (d) {\n  mean(d$differential_diagnoses_malnutrition, na.rm = TRUE)\n}\n
      11 function (d) {\n  mean(d$baseline_normalized_protein_catabolic_rate, na.rm = TRUE)\n}\n
           boundaries       value
      1  [0.40, 0.60]   0.4444444
      2  [0.40, 0.60]   0.5555556
      3      [20, 60]  44.3888889
      4      [32, 39]  23.6666667
      5       [3, 15]  23.1687500
      6      [18, 24]  24.8500000
      7    [100, 140] 134.1176471
      8    [1.2, 5.0]   1.9166667
      9  [0.85, 0.99]   0.8888889
      10   [1.0, 1.0]   1.0000000
      11   [0.0, 1.2]   0.9312500

---

    Code
      result$smell_status
    Output
      [1] "11 smells have been sniffed.  3 violation(s) were found."

---

    Code
      result$rules
    Output
      # A tibble: 14 x 8
         check_name     violation_count error_message priority debug redcap_instrument
         <chr>                    <int> <chr>            <int> <lgl> <chr>            
       1 baseline_prea~              10 Serum pre-al~        1 FALSE baseline_data    
       2 missing_serum~               3 Relevant nut~        1 FALSE baseline_data    
       3 serum_prealbu~              15 Baseline pre~        2 FALSE baseline_data, v~
       4 serum_prealbu~               0 Baseline pre~        2 FALSE baseline_data, v~
       5 serum_prealbu~               0 Baseline pre~        2 FALSE baseline_data, v~
       6 serum_prealbu~               0 serum prealb~        3 FALSE baseline_data, v~
       7 baseline_firs~               0 Serum prealb~        3 FALSE baseline_data, v~
       8 daily_first_v~               0 In-addition ~        3 FALSE baseline_data, p~
       9 daily_protein~               0 npcr levels ~        3 FALSE baseline_data, p~
      10 hospitalizati~               2 Patient was ~        1 FALSE completion_proje~
      11 optimal_daily~               7 Daily protei~        2 FALSE completion_proje~
      12 recommended_n~              10 NPCR values ~        2 FALSE completion_data  
      13 npcr                         1 NPCR at comp~        2 FALSE completion_data  
      14 npcr_comparis~               2 NPCR at comp~        3 FALSE completion_data  
      # i 2 more variables: passing_test <chr>, results <list>

---

    Code
      as.data.frame(dplyr::select(result$rules, !tidyselect::contains("results")))
    Output
                                          check_name violation_count
      1                   baseline_prealbumin_levels              10
      2                  missing_serum_marker_levels               3
      3                    serum_prealbumin_levels_1              15
      4                    serum_prealbumin_levels_2               0
      5      serum_prealbumin_levels_completion_data               0
      6         serum_prealbumin_levels_expectations               0
      7          baseline_first_visit_lab_parameters               0
      8  daily_first_visit_lab_and_workup_parameters               0
      9                         daily_protein_intake               0
      10                      hospitalization_reason               2
      11                optimal_daily_protein_intake               7
      12                      recommended_npcr_range              10
      13                                        npcr               1
      14                             npcr_comparison               2
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
      3         2 FALSE
      4         2 FALSE
      5         2 FALSE
      6         3 FALSE
      7         3 FALSE
      8         3 FALSE
      9         3 FALSE
      10        1 FALSE
      11        2 FALSE
      12        2 FALSE
      13        2 FALSE
      14        3 FALSE
                                                          redcap_instrument
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
      1                                                                                                                                                                                                                                                                                                                                                                                      function (d) {\n  dplyr::if_else(\n    !is.na(d$date_enrolled),\n    dplyr::between(d$baseline_prealbumin_level, 30, 40),\n    TRUE\n  )\n}\n
      2                                                                                                                                                                                                                                                                                           function (d) {\n  dplyr::if_else(\n    !is.na(d$date_enrolled),\n    (\n      !is.na(d$baseline_prealbumin_level) &\n      !is.na(d$baseline_creatinine_level) &\n      !is.na(d$baseline_transferrin_level)\n    ),\n    TRUE\n  )\n}\n
      3                                                                                                                                                                                                                                                          function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  dplyr::if_else(\n    (\n      d$redcap_event_name %in% events_to_check &\n      !is.na(d$baseline_prealbumin_level)\n    ),\n    !is.na(d$visit_lab_prealbumin_level),\n    TRUE\n  )\n}\n
      4                                                                                                                                                                                                      function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1")\n  dplyr::if_else(\n    (\n      d$redcap_event_name %in% events_to_check &\n      !is.na(d$baseline_prealbumin_level) &\n      !is.na(d$visit_lab_prealbumin_level)\n    ),\n    !is.na(d$visit_blood_workup_prealbumin_level),\n    TRUE\n  )\n}\n
      5                                                                                                                             function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  dplyr::if_else(\n    (\n      d$redcap_event_name %in% events_to_check &\n      !is.na(d$baseline_prealbumin_level) &\n      !is.na(d$visit_lab_prealbumin_level) &\n      !is.na(d$visit_blood_workup_prealbumin_level)\n    ),\n    !is.na(d$completion_data_prealbumin_level),\n    TRUE\n  )\n}\n
      6                                                function (d) {\n  events_to_check <- c("visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  dplyr::if_else(\n    (\n      d$redcap_event_name %in% events_to_check &\n      !is.na(d$baseline_prealbumin_level) &\n      !is.na(d$visit_lab_prealbumin_level) &\n      !is.na(d$visit_blood_workup_prealbumin_level) &\n      !is.na(d$completion_data_prealbumin_level)\n    ),\n    (d$visit_lab_prealbumin_level < d$completion_data_prealbumin_level),\n    TRUE\n  )\n}\n
      7                                                                                                                                                               function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  dplyr::if_else(\n    (\n      d$redcap_event_name %in% events_to_check &\n      (d$baseline_prealbumin_level < 30) &\n      (d$baseline_normalized_protein_catabolic_rate < 1.2)\n    ),\n    (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr),\n    TRUE\n  )\n}\n
      8                                                                                                      function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1")\n  dplyr::if_else(\n    (\n      (d$redcap_event_name %in% events_to_check) &\n      (d$baseline_prealbumin_level < 30) &\n      (d$baseline_normalized_protein_catabolic_rate < 1.2) &\n      (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr)\n    ),\n    d$visit_lab_npcr <= d$visit_blood_workup_npcr,\n    TRUE\n  )\n}\n
      9  function (d) {\n  events_to_check <- c("enrollment_arm_1", "visit_1_arm_1", "visit_2_arm_1", "final_visit_arm_1")\n  dplyr::if_else(\n    (\n      (d$redcap_event_name %in% events_to_check) &\n      (d$baseline_prealbumin_level < 30) &\n      (d$baseline_normalized_protein_catabolic_rate < 1.2) &\n      (d$baseline_normalized_protein_catabolic_rate <= d$visit_lab_npcr) &\n      (d$visit_lab_npcr <= d$visit_blood_workup_npcr)\n    ),\n    d$visit_blood_workup_npcr < d$completion_data_npcr,\n    TRUE\n  )\n}\n
      10                                                                                                                                                                                                                                                                     function (d) {\n  dplyr::if_else(\n    d$completion_project_questionnaire_hospitalization == 1L,\n    !is.na(d$completion_project_questionnaire_hospitalization_cause) & !is.na(d$completion_project_questionnaire_hospitalization_date),\n    TRUE\n  )\n}\n
      11                                                                                                                                                                                                                                                                                                                                                                        function (d) {\n  dplyr::if_else(\n    d$completion_data_npcr >= 1.2,\n    dplyr::between(d$completion_data_prealbumin_level, 30, 40),\n    TRUE\n  )\n}\n
      12                                                                                                                                                                                                                                                                                                                                                                                                                                                           function (d) {\n  dplyr::between(d$completion_data_npcr, 1.2, 1.4)\n}\n
      13                                 function (d) {\n  events_to_check <- c("final_visit_arm_1")\n  dplyr::if_else(\n    d$redcap_event_name %in% events_to_check,\n    !is.na(d$completion_data_npcr),                                                                # If this row exists in the desired event, then check for nonmissingness.\n    TRUE                                                                                           # Otherwise, the test passes for rows associated with all other events.\n  )\n}\n
      14                                                                                                                                                                                                                                                                                                                                                                                      function (d) {\n  dplyr::if_else(\n    !is.na(d$completion_data_npcr),\n    (d$npcr_at_baseline < d$completion_data_npcr),\n    TRUE\n  )\n}

---

    Code
      ds_result_unnested
    Output
      # A tibble: 50 x 5
         check_name            record_id data_collector baseline_date record_id_linked
         <chr>                     <int>          <int> <date>        <chr>           
       1 baseline_prealbumin_~         1              1 2015-01-02    "<a href=\"http~
       2 baseline_prealbumin_~         2              2 2015-01-02    "<a href=\"http~
       3 baseline_prealbumin_~         3              3 2015-01-05    "<a href=\"http~
       4 baseline_prealbumin_~         8              1 2015-02-03    "<a href=\"http~
       5 baseline_prealbumin_~         9              3 2015-02-08    "<a href=\"http~
       6 baseline_prealbumin_~        12              3 2015-03-06    "<a href=\"http~
       7 baseline_prealbumin_~        13              1 2015-03-15    "<a href=\"http~
       8 baseline_prealbumin_~        14              1 2015-03-10    "<a href=\"http~
       9 baseline_prealbumin_~        15              3 2015-03-03    "<a href=\"http~
      10 baseline_prealbumin_~       100              1 2015-04-02    "<a href=\"http~
      # i 40 more rows

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
      10   baseline_prealbumin_levels       100              1    2015-04-02
      11  missing_serum_marker_levels         7              2    2015-01-27
      12  missing_serum_marker_levels        10            255    2015-02-13
      13  missing_serum_marker_levels        11              2    2015-02-19
      14    serum_prealbumin_levels_1         1              1    2015-01-02
      15    serum_prealbumin_levels_1         2              2    2015-01-02
      16    serum_prealbumin_levels_1         3              3    2015-01-05
      17    serum_prealbumin_levels_1         4            255    2015-01-10
      18    serum_prealbumin_levels_1         5              1    2015-01-13
      19    serum_prealbumin_levels_1         6              3    2015-01-16
      20    serum_prealbumin_levels_1         8              1    2015-02-03
      21    serum_prealbumin_levels_1         9              3    2015-02-08
      22    serum_prealbumin_levels_1        12              3    2015-03-06
      23    serum_prealbumin_levels_1        13              1    2015-03-15
      24    serum_prealbumin_levels_1        14              1    2015-03-10
      25    serum_prealbumin_levels_1        15              3    2015-03-03
      26    serum_prealbumin_levels_1        16              2    2015-03-09
      27    serum_prealbumin_levels_1       100              1    2015-04-02
      28    serum_prealbumin_levels_1       220              1    2015-04-02
      29       hospitalization_reason         8             NA          <NA>
      30       hospitalization_reason        14             NA          <NA>
      31 optimal_daily_protein_intake         5             NA          <NA>
      32 optimal_daily_protein_intake         6             NA          <NA>
      33 optimal_daily_protein_intake         7             NA          <NA>
      34 optimal_daily_protein_intake         8             NA          <NA>
      35 optimal_daily_protein_intake        11             NA          <NA>
      36 optimal_daily_protein_intake        15             NA          <NA>
      37 optimal_daily_protein_intake       100             NA          <NA>
      38       recommended_npcr_range         1             NA          <NA>
      39       recommended_npcr_range         6             NA          <NA>
      40       recommended_npcr_range         7             NA          <NA>
      41       recommended_npcr_range         8             NA          <NA>
      42       recommended_npcr_range        12             NA          <NA>
      43       recommended_npcr_range        13             NA          <NA>
      44       recommended_npcr_range        14             NA          <NA>
      45       recommended_npcr_range        16             NA          <NA>
      46       recommended_npcr_range       100             NA          <NA>
      47       recommended_npcr_range       220             NA          <NA>
      48                         npcr        10             NA          <NA>
      49              npcr_comparison         1             NA          <NA>
      50              npcr_comparison        12             NA          <NA>
                                                                                                                                                                        record_id_linked
      1                                          <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=baseline_data" target="_blank">1</a>
      2                                          <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=2&page=baseline_data" target="_blank">2</a>
      3                                          <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=3&page=baseline_data" target="_blank">3</a>
      4                                          <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=baseline_data" target="_blank">8</a>
      5                                          <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=9&page=baseline_data" target="_blank">9</a>
      6                                        <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=baseline_data" target="_blank">12</a>
      7                                        <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=baseline_data" target="_blank">13</a>
      8                                        <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=baseline_data" target="_blank">14</a>
      9                                        <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=baseline_data" target="_blank">15</a>
      10                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=baseline_data" target="_blank">100</a>
      11                                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=baseline_data" target="_blank">7</a>
      12                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=10&page=baseline_data" target="_blank">10</a>
      13                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=11&page=baseline_data" target="_blank">11</a>
      14                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=baseline_data, visit_lab_date" target="_blank">1</a>
      15                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=2&page=baseline_data, visit_lab_date" target="_blank">2</a>
      16                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=3&page=baseline_data, visit_lab_date" target="_blank">3</a>
      17                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=4&page=baseline_data, visit_lab_date" target="_blank">4</a>
      18                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=5&page=baseline_data, visit_lab_date" target="_blank">5</a>
      19                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=baseline_data, visit_lab_date" target="_blank">6</a>
      20                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=baseline_data, visit_lab_date" target="_blank">8</a>
      21                         <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=9&page=baseline_data, visit_lab_date" target="_blank">9</a>
      22                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=baseline_data, visit_lab_date" target="_blank">12</a>
      23                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=baseline_data, visit_lab_date" target="_blank">13</a>
      24                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=baseline_data, visit_lab_date" target="_blank">14</a>
      25                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=baseline_data, visit_lab_date" target="_blank">15</a>
      26                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=16&page=baseline_data, visit_lab_date" target="_blank">16</a>
      27                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=baseline_data, visit_lab_date" target="_blank">100</a>
      28                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=220&page=baseline_data, visit_lab_date" target="_blank">220</a>
      29                      <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_project_questionnaire" target="_blank">8</a>
      30                    <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=completion_project_questionnaire" target="_blank">14</a>
      31     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=5&page=completion_project_questionnaire, completion_data" target="_blank">5</a>
      32     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=completion_project_questionnaire, completion_data" target="_blank">6</a>
      33     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=completion_project_questionnaire, completion_data" target="_blank">7</a>
      34     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_project_questionnaire, completion_data" target="_blank">8</a>
      35   <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=11&page=completion_project_questionnaire, completion_data" target="_blank">11</a>
      36   <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=completion_project_questionnaire, completion_data" target="_blank">15</a>
      37 <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=completion_project_questionnaire, completion_data" target="_blank">100</a>
      38                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=completion_data" target="_blank">1</a>
      39                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=completion_data" target="_blank">6</a>
      40                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=completion_data" target="_blank">7</a>
      41                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_data" target="_blank">8</a>
      42                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=completion_data" target="_blank">12</a>
      43                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=completion_data" target="_blank">13</a>
      44                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=completion_data" target="_blank">14</a>
      45                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=16&page=completion_data" target="_blank">16</a>
      46                                   <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=completion_data" target="_blank">100</a>
      47                                   <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=220&page=completion_data" target="_blank">220</a>
      48                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=10&page=completion_data" target="_blank">10</a>
      49                                       <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=completion_data" target="_blank">1</a>
      50                                     <a href="https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=completion_data" target="_blank">12</a>

---

    Code
      result$rule_status
    Output
      [1] "14 rules were examined. 8 rule(s) had at least 1 violation. 50 total violation(s) were found."

