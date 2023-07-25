# load-checks-biochemical

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
      checks$smells
    Output
      # A tibble: 11 x 10
         check_name description priority debug bound_lower bound_upper bounds_template
         <chr>      <chr>          <int> <lgl>       <dbl>       <dbl> <chr>          
       1 females    Proportion~        2 FALSE        0.4         0.6  [%.2f, %.2f]   
       2 males      Proportion~        2 FALSE        0.4         0.6  [%.2f, %.2f]   
       3 age        Mean parti~        2 FALSE       20          60    [%.0f, %.0f]   
       4 serum_pre~ Mean serum~        2 FALSE       32          39    [%.0f, %.0f]   
       5 serum_cre~ Mean serum~        2 FALSE        3          15    [%.0f, %.0f]   
       6 bmi_at_ba~ Mean BMI i~        2 FALSE       18          24    [%.0f, %.0f]   
       7 serum_cho~ Mean chole~        1 FALSE      100         140    [%.0f, %.0f]   
       8 dialysis_~ Mean Kt/V ~        1 FALSE        1.2         5    [%.1f, %.1f]   
       9 nutrition~ Most patie~        2 FALSE        0.85        0.99 [%.2f, %.2f]   
      10 definitiv~ The propor~        1 FALSE        1           1    [%.1f, %.1f]   
      11 normalize~ Mean Norma~        1 FALSE        0           1.2  [%.1f, %.1f]   
      # i 3 more variables: value_template <chr>, equation <chr>, boundaries <chr>

---

    Code
      as.data.frame(checks$smells)
    Output
                                   check_name
      1                               females
      2                                 males
      3                                   age
      4    serum_prealbumin_level_at_baseline
      5    serum_creatinine_level_at_baseline
      6                       bmi_at_baseline
      7  serum_cholesterol_levels_at_baseline
      8                     dialysis_adequacy
      9                nutritional_counseling
      10                 definitive_diagnosis
      11    normalized_protein_catabolic_rate
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
           boundaries
      1  [0.40, 0.60]
      2  [0.40, 0.60]
      3      [20, 60]
      4      [32, 39]
      5       [3, 15]
      6      [18, 24]
      7    [100, 140]
      8    [1.2, 5.0]
      9  [0.85, 0.99]
      10   [1.0, 1.0]
      11   [0.0, 1.2]

---

    Code
      checks$smells_inactive
    Output
      # A tibble: 1 x 9
        check_name  description priority debug bound_lower bound_upper bounds_template
        <chr>       <chr>          <int> <lgl>       <dbl>       <dbl> <chr>          
      1 average_se~ ??Units co~        1 FALSE         501        1200 [%.0f, %.0f]   
      # i 2 more variables: value_template <chr>, equation <chr>

---

    Code
      cat(checks$smell_names_md)
    Output
      11 smells have been defined:
      
      1. females;
      2. males;
      3. age;
      4. serum_prealbumin_level_at_baseline;
      5. serum_creatinine_level_at_baseline;
      6. bmi_at_baseline;
      7. serum_cholesterol_levels_at_baseline;
      8. dialysis_adequacy;
      9. nutritional_counseling;
      10. definitive_diagnosis;
      11. normalized_protein_catabolic_rate;

---

    Code
      checks$rules
    Output
      # A tibble: 14 x 6
         check_name        error_message priority debug redcap_instrument passing_test
         <chr>             <chr>            <int> <lgl> <chr>             <chr>       
       1 baseline_prealbu~ Serum pre-al~        1 FALSE baseline_data     "function (~
       2 missing_serum_ma~ Relevant nut~        1 FALSE baseline_data     "function (~
       3 serum_prealbumin~ Baseline pre~        2 FALSE baseline_data, v~ "function (~
       4 serum_prealbumin~ Baseline pre~        2 FALSE baseline_data, v~ "function (~
       5 serum_prealbumin~ Baseline pre~        2 FALSE baseline_data, v~ "function (~
       6 serum_prealbumin~ serum prealb~        3 FALSE baseline_data, v~ "function (~
       7 baseline_first_v~ Serum prealb~        3 FALSE baseline_data, v~ "function (~
       8 daily_first_visi~ In-addition ~        3 FALSE baseline_data, p~ "function (~
       9 daily_protein_in~ npcr levels ~        3 FALSE baseline_data, p~ "function (~
      10 hospitalization_~ Patient was ~        1 FALSE completion_proje~ "function (~
      11 optimal_daily_pr~ Daily protei~        2 FALSE completion_proje~ "function (~
      12 recommended_npcr~ NPCR values ~        2 FALSE completion_data   "function (~
      13 npcr              NPCR at comp~        2 FALSE completion_data   "function (~
      14 npcr_comparison   NPCR at comp~        3 FALSE completion_data   "function (~

---

    Code
      as.data.frame(checks$rules)
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
      checks$rules_inactive
    Output
      # A tibble: 1 x 6
        check_name         error_message priority debug redcap_instrument passing_test
        <chr>              <chr>            <int> <lgl> <chr>             <chr>       
      1 pre_albumin_levels pre_albumin ~        3 FALSE visit_lab_date    "function (~

