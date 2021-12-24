# load-checks-biochemical

    Code
      checks$ds_smell
    Output
      # A tibble: 12 x 10
         check_name description priority debug bound_lower bound_upper bounds_template
         <chr>      <chr>          <int> <lgl>       <dbl>       <dbl> <chr>          
       1 proportio~ Proportion~        1 FALSE        0.5         0.5  [%.2f, %.2f]   
       2 proportio~ Proportion~        1 FALSE        0.5         0.5  [%.2f, %.2f]   
       3 mean_age   Mean age o~        1 FALSE       20          80    [%.2f, %.2f]   
       4 mean_seru~ Mean serum~        1 FALSE       32          39    [%.2f, %.2f]   
       5 mean_seru~ Mean serum~        1 FALSE        3          15    [%.2f, %.2f]   
       6 average_b~ Average BM~        1 FALSE       18          24    [%.2f, %.2f]   
       7 mean_seru~ Average Ch~        1 FALSE      100         140    [%.2f, %.2f]   
       8 dialysis_~ Normal ran~        1 FALSE        1.2         5    [%.2f, %.2f]   
       9 average_s~ Mean serum~        1 FALSE      501        1200    [%.0f, %.0f]   
      10 nutrition~ Most patie~        1 FALSE        0.85        0.99 [%.2f, %.2f]   
      11 definitiv~ A 100 perc~        1 FALSE        1           1    [%.2f, %.2f]   
      12 normalize~ Average No~        1 FALSE        0           0.12 [%.2f, %.2f]   
      # ... with 3 more variables: value_template <chr>, equation <chr>,
      #   boundaries <chr>

---

    Code
      as.data.frame(checks$ds_smell)
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
               boundaries
      1      [0.50, 0.50]
      2      [0.50, 0.50]
      3    [20.00, 80.00]
      4    [32.00, 39.00]
      5     [3.00, 15.00]
      6    [18.00, 24.00]
      7  [100.00, 140.00]
      8      [1.20, 5.00]
      9       [501, 1200]
      10     [0.85, 0.99]
      11     [1.00, 1.00]
      12     [0.00, 0.12]

---

    Code
      checks$ds_smell_inactive
    Output
      # A tibble: 0 x 9
      # ... with 9 variables: check_name <chr>, description <chr>, priority <int>,
      #   debug <lgl>, bound_lower <dbl>, bound_upper <dbl>, bounds_template <chr>,
      #   value_template <chr>, equation <chr>

---

    Code
      checks$ds_rule
    Output
      # A tibble: 14 x 7
         check_name   error_message   priority active debug instrument  passing_test  
         <chr>        <chr>              <int> <lgl>  <lgl> <chr>       <chr>         
       1 baseline_pr~ Serum pre-albu~        1 TRUE   FALSE baseline_d~ "function (d)~
       2 missing_ser~ Relevant nutri~        1 TRUE   FALSE baseline_d~ "function (d)~
       3 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function (d)~
       4 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function (d)~
       5 serum_preal~ Baseline preal~        1 TRUE   FALSE baseline_d~ "function (d)~
       6 serum_preal~ serum prealbum~        1 TRUE   FALSE baseline_d~ "function (d)~
       7 baseline_fi~ Serum prealbum~        1 TRUE   FALSE baseline_d~ "function (d)~
       8 daily_first~ In-addition to~        1 TRUE   FALSE baseline_d~ "function (d)~
       9 daily_prote~ npcr levels in~        1 TRUE   FALSE baseline_d~ "function (d)~
      10 hospitaliza~ Patient was ho~        1 TRUE   FALSE completion~ "function (d)~
      11 optimal_dai~ Daily protein ~        1 TRUE   FALSE completion~ "function (d)~
      12 recommended~ NPCR values ar~        1 TRUE   FALSE completion~ "function (d)~
      13 npcr         NPCR at comple~        1 TRUE   FALSE completion~ "function (d)~
      14 npcr_compar~ NPCR at comple~        1 TRUE   FALSE completion~ "function (d)~

---

    Code
      as.data.frame(checks$ds_rule)
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
         priority active debug
      1         1   TRUE FALSE
      2         1   TRUE FALSE
      3         1   TRUE FALSE
      4         1   TRUE FALSE
      5         1   TRUE FALSE
      6         1   TRUE FALSE
      7         1   TRUE FALSE
      8         1   TRUE FALSE
      9         1   TRUE FALSE
      10        1   TRUE FALSE
      11        1   TRUE FALSE
      12        1   TRUE FALSE
      13        1   TRUE FALSE
      14        1   TRUE FALSE
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
      checks$ds_rule_inactive
    Output
      # A tibble: 1 x 7
        check_name         error_message priority active debug instrument passing_test
        <chr>              <chr>            <int> <lgl>  <lgl> <chr>      <chr>       
      1 pre_albumin_levels pre_albumin ~        1 FALSE  FALSE visit_lab~ "function (~

