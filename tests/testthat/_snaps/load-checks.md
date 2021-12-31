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
      [1] "https://github.com/OuhscBbmc/validator-1/blob/master"

---

    Code
      checks$smells
    Output
      # A tibble: 12 x 10
         check_name description priority debug bound_lower bound_upper bounds_template
         <chr>      <chr>          <int> <lgl>       <dbl>       <dbl> <chr>          
       1 proportio~ Proportion~        2 FALSE        0.25        0.75 [%.2f, %.2f]   
       2 proportio~ Proportion~        2 FALSE        0.25        0.75 [%.2f, %.2f]   
       3 mean_age   Mean age o~        2 FALSE       20          80    [%.0f, %.0f]   
       4 mean_seru~ Mean serum~        2 FALSE       32          39    [%.0f, %.0f]   
       5 mean_seru~ Mean serum~        2 FALSE        3          15    [%.0f, %.0f]   
       6 average_b~ Average BM~        2 FALSE       18          24    [%.0f, %.0f]   
       7 mean_seru~ Average Ch~        1 FALSE      100         140    [%.0f, %.0f]   
       8 dialysis_~ Normal ran~        1 FALSE        1.2         5    [%.1f, %.1f]   
       9 average_s~ Mean serum~        1 FALSE      501        1200    [%.0f, %.0f]   
      10 nutrition~ Most patie~        2 FALSE        0.85        0.99 [%.2f, %.2f]   
      11 definitiv~ All study ~        1 FALSE        1           1    [%.2f, %.2f]   
      12 normalize~ Average No~        1 FALSE        0           0.12 [%.2f, %.2f]   
      # ... with 3 more variables: value_template <chr>, equation <chr>,
      #   boundaries <chr>

---

    Code
      as.data.frame(checks$smells)
    Output
                                        check_name
      1             proportion_female_participants
      2               proportion_male_participants
      3                                   mean_age
      4    mean_serum_prealbumin_level_at_baseline
      5    mean_serum_creatinine_level_at_baseline
      6                    average_bmi_at_baseline
      7  mean_serum_cholesterol_levels_at_baseline
      8                          dialysis_adequacy
      9  average_serum_ferritin_levels_at_baseline
      10                    nutritional_counseling
      11                      definitive_diagnosis
      12         normalized_protein_catabolic_rate
                                                                                           description
      1                  Proportion female participants is half the participants till study conclusion
      2                    Proportion male participants is half the participants till study conclusion
      3                                       Mean age of participants is between 18 years to 20 years
      4                      Mean serum pre-albumin levels at baseline are between 31mg/dl and 39mg/dl
      5                        Mean serum creatinine levels at baseline are between 3mg/dl and 15mg/dl
      6                                                               Average BMI is between 18 and 24
      7                Average Cholesterol levels range is between 100mg/dl-140mg/dl at baseline level
      8                                             Normal range for Kt/V values are between 1.2 and 5
      9                Mean serum ferritin levels are in the recommended range of > 500ng/dl-1200ng/dl
      10                                      Most patients agreed to receiving nutritional counseling
      11 All study participants were diagnosed with malnutrition associated with Chronic Renal Disease
      12                                    Average Normalized Protein Catabolic Rate is < 1.2g/kg/day
         priority debug bound_lower bound_upper bounds_template value_template
      1         2 FALSE        0.25        0.75    [%.2f, %.2f]           %.3f
      2         2 FALSE        0.25        0.75    [%.2f, %.2f]           %.3f
      3         2 FALSE       20.00       80.00    [%.0f, %.0f]           %.1f
      4         2 FALSE       32.00       39.00    [%.0f, %.0f]           %.1f
      5         2 FALSE        3.00       15.00    [%.0f, %.0f]           %.1f
      6         2 FALSE       18.00       24.00    [%.0f, %.0f]           %.1f
      7         1 FALSE      100.00      140.00    [%.0f, %.0f]           %.1f
      8         1 FALSE        1.20        5.00    [%.1f, %.1f]           %.2f
      9         1 FALSE      501.00     1200.00    [%.0f, %.0f]           %.1f
      10        2 FALSE        0.85        0.99    [%.2f, %.2f]           %.3f
      11        1 FALSE        1.00        1.00    [%.2f, %.2f]           %.2f
      12        1 FALSE        0.00        0.12    [%.2f, %.2f]           %.3f
                                                                                        equation
      1                             function (d) {\n  mean(d$sex == "female", na.rm = TRUE)\n}\n
      2                               function (d) {\n  mean(d$sex == "male", na.rm = TRUE)\n}\n
      3                                         function (d) {\n  mean(d$age, na.rm = TRUE)\n}\n
      4                   function (d) {\n  mean(d$baseline_prealbumin_level, na.rm = TRUE)\n}\n
      5                   function (d) {\n  mean(d$baseline_creatinine_level, na.rm = TRUE)\n}\n
      6                                function (d) {\n  mean(d$baseline_bmi, na.rm = TRUE)\n}\n
      7                        function (d) {\n  mean(d$baseline_cholesterol, na.rm = TRUE)\n}\n
      8  function (d) {\n  mean(d$completion_project_questionnaire_ktv_value, na.rm = TRUE)\n}\n
      9                     function (d) {\n  mean(d$baseline_ferritin_level, na.rm = TRUE)\n}\n
      10                     function (d) {\n  mean(d$nutritional_counseling, na.rm = TRUE)\n}\n
      11        function (d) {\n  mean(d$differential_diagnoses_malnutrition, na.rm = TRUE)\n}\n
      12 function (d) {\n  mean(d$baseline_normalized_protein_catabolic_rate, na.rm = TRUE)\n}\n
           boundaries
      1  [0.25, 0.75]
      2  [0.25, 0.75]
      3      [20, 80]
      4      [32, 39]
      5       [3, 15]
      6      [18, 24]
      7    [100, 140]
      8    [1.2, 5.0]
      9   [501, 1200]
      10 [0.85, 0.99]
      11 [1.00, 1.00]
      12 [0.00, 0.12]

---

    Code
      checks$smells_inactive
    Output
      # A tibble: 0 x 9
      # ... with 9 variables: check_name <chr>, description <chr>, priority <int>,
      #   debug <lgl>, bound_lower <dbl>, bound_upper <dbl>, bounds_template <chr>,
      #   value_template <chr>, equation <chr>

---

    Code
      cat(checks$smell_names_md)
    Output
      12 smells have been defined:
      
      1. proportion_female_participants;
      2. proportion_male_participants;
      3. mean_age;
      4. mean_serum_prealbumin_level_at_baseline;
      5. mean_serum_creatinine_level_at_baseline;
      6. average_bmi_at_baseline;
      7. mean_serum_cholesterol_levels_at_baseline;
      8. dialysis_adequacy;
      9. average_serum_ferritin_levels_at_baseline;
      10. nutritional_counseling;
      11. definitive_diagnosis;
      12. normalized_protein_catabolic_rate;

---

    Code
      checks$rules
    Output
      # A tibble: 14 x 6
         check_name    error_message     priority debug instrument    passing_test    
         <chr>         <chr>                <int> <lgl> <chr>         <chr>           
       1 baseline_pre~ Serum pre-albumi~        1 FALSE baseline_data "function (d) {~
       2 missing_seru~ Relevant nutriti~        1 FALSE baseline_data "function (d) {~
       3 serum_prealb~ Baseline prealbu~        2 FALSE baseline_dat~ "function (d) {~
       4 serum_prealb~ Baseline prealbu~        2 FALSE baseline_dat~ "function (d) {~
       5 serum_prealb~ Baseline prealbu~        2 FALSE baseline_dat~ "function (d) {~
       6 serum_prealb~ serum prealbumin~        3 FALSE baseline_dat~ "function (d) {~
       7 baseline_fir~ Serum prealbumin~        3 FALSE baseline_dat~ "function (d) {~
       8 daily_first_~ In-addition to b~        3 FALSE baseline_dat~ "function (d) {~
       9 daily_protei~ npcr levels in s~        3 FALSE baseline_dat~ "function (d) {~
      10 hospitalizat~ Patient was hosp~        1 FALSE completion_p~ "function (d) {~
      11 optimal_dail~ Daily protein in~        2 FALSE completion_p~ "function (d) {~
      12 recommended_~ NPCR values are ~        2 FALSE completion_d~ "function (d) {~
      13 npcr          NPCR at completi~        2 FALSE completion_d~ "function (d) {~
      14 npcr_compari~ NPCR at completi~        3 FALSE completion_d~ "function (d) {~

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
        check_name         error_message   priority debug instrument  passing_test    
        <chr>              <chr>              <int> <lgl> <chr>       <chr>           
      1 pre_albumin_levels pre_albumin le~        3 FALSE visit_lab_~ "function (d) {~

