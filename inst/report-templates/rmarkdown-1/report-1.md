---
title: Trawler Report
date: "Date: 2021-12-30 16:45:46"
output:
  html_document:
    keep_md: yes
    toc: yes
    toc_float: true
    number_sections: true
    # css: ../analysis/common/styles-1.css
params:
  path_checks: "not-set"
---

<!-- Set the report-wide options, and point to the external code file. -->


<!-- Suppress the output when loading packages. -->


<!-- Load any global functions and variables declared in the R file.  Suppress the output. -->


<!-- Load the datasets.   -->


<!-- Tweak the datasets.   -->



Rules {.tabset .tabset-fade}
=============================

A *rule* is very exact.  Each record is examined, and determined if it passes each specific rule.

Rule Summary
-----------------------------
<table class="table table-hover table-condensed table-responsive" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Rule Name </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: #555 !important;"> Priority </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Error Message </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: #555 !important;"> Violation Count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> baseline_prealbumin_levels </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Serum pre-albumin level of all enrolled patients do not meet the study criterion </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> missing_serum_marker_levels </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Relevant nutritional serum markers are missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> serum_prealbumin_levels_1 </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum_prealbumin_levels_2 </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Baseline prealbumin levels and pre-albumin levels during the 1st visit are not missing however levels in the next reading are missing </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum_prealbumin_levels_completion_data </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Baseline prealbumin levels are not missing however readings are not carefully monitored at completion </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum_prealbumin_levels_expectations </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> serum prealbumin levels are not missing however subsequent readings did not come as expected </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> baseline_first_visit_lab_parameters </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Serum prealbumin levels are low and protein intake at baseline is less than optimal </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> daily_first_visit_lab_and_workup_parameters </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> In-addition to baseline &amp; visit lab protein parameters, blood work-up npcr levels are also low </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> daily_protein_intake </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> npcr levels in study have not improved as intended </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> hospitalization_reason </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Patient was hospitalized but reason and the date of hospitalization is missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> optimal_daily_protein_intake </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Daily protein intake is optimal but one of the nutritional marker is not within the normal range </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> recommended_npcr_range </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> NPCR values are not within the recommended range at completion </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> npcr </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> NPCR at completion is missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> npcr_comparison </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> NPCR at completion is not greater than npcr at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 2 </td>
  </tr>
</tbody>
</table>

Rule Detail
-----------------------------

```{=html}
<div id="htmlwidget-f74768cb549c25a5efde" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-f74768cb549c25a5efde">{"x":{"filter":"top","vertical":false,"filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;baseline_first_visit_lab_parameters&quot;,&quot;baseline_prealbumin_levels&quot;,&quot;daily_first_visit_lab_and_workup_parameters&quot;,&quot;daily_protein_intake&quot;,&quot;hospitalization_reason&quot;,&quot;missing_serum_marker_levels&quot;,&quot;npcr&quot;,&quot;npcr_comparison&quot;,&quot;optimal_daily_protein_intake&quot;,&quot;recommended_npcr_range&quot;,&quot;serum_prealbumin_levels_1&quot;,&quot;serum_prealbumin_levels_2&quot;,&quot;serum_prealbumin_levels_completion_data&quot;,&quot;serum_prealbumin_levels_expectations&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"disabled\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","caption":"<caption>Violations at 2021-12-30 16:45:47<\/caption>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14"],["baseline_prealbumin_levels","missing_serum_marker_levels","serum_prealbumin_levels_1","serum_prealbumin_levels_2","serum_prealbumin_levels_completion_data","serum_prealbumin_levels_expectations","baseline_first_visit_lab_parameters","daily_first_visit_lab_and_workup_parameters","daily_protein_intake","hospitalization_reason","optimal_daily_protein_intake","recommended_npcr_range","npcr","npcr_comparison"],["Serum pre-albumin level of all enrolled patients do not meet the study criterion","Relevant nutritional serum markers are missing","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels and pre-albumin levels during the 1st visit are not missing however levels in the next reading are missing","Baseline prealbumin levels are not missing however readings are not carefully monitored at completion","serum prealbumin levels are not missing however subsequent readings did not come as expected","Serum prealbumin levels are low and protein intake at baseline is less than optimal","In-addition to baseline & visit lab protein parameters, blood work-up npcr levels are also low","npcr levels in study have not improved as intended","Patient was hospitalized but reason and the date of hospitalization is missing","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","NPCR values are not within the recommended range at completion","NPCR at completion is missing","NPCR at completion is not greater than npcr at baseline"],[1,1,1,1,1,1,1,1,1,1,1,1,1,1]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>check name<\/th>\n      <th>error message<\/th>\n      <th>priority<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":30,"dom":"tip","initComplete":"function(settings, json) {\n$(this.api().table().header()).css({'background-color': '#555', 'color': '#fff'});\n}","columnDefs":[{"className":"dt-right","targets":3},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true,"lengthMenu":[10,25,30,50,100]}},"evals":["options.initComplete"],"jsHooks":[]}</script>
```

Smells {.tabset .tabset-fade}
=============================

A *smell* test won't validate a specific record (like the rules above), but it will make sure the dataset overall smells correct.

Smell Summary
-----------------------------
<table class="table table-hover table-condensed table-responsive" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Smell Name </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: #555 !important;"> Priority </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Proportion of... </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Legal Boundaries </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: #555 !important;"> Value </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: #555 !important;"> Pass </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: #555 !important;"> average serum ferritin levels at baseline </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Mean serum ferritin levels are in the recommended range of &gt; 500ng/dl-1200ng/dl </td>
   <td style="text-align:left;color: #555 !important;"> [501, 1200] </td>
   <td style="text-align:right;color: #555 !important;"> 589.1 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> definitive diagnosis </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> All study participants were diagnosed with malnutrition associated with Chronic Renal Disease </td>
   <td style="text-align:left;color: #555 !important;"> [1.00, 1.00] </td>
   <td style="text-align:right;color: #555 !important;"> 1.00 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> dialysis adequacy </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Normal range for Kt/V values are between 1.2 and 5 </td>
   <td style="text-align:left;color: #555 !important;"> [1.2, 5.0] </td>
   <td style="text-align:right;color: #555 !important;"> 1.92 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> mean serum cholesterol levels at baseline </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Average Cholesterol levels range is between 100mg/dl-140mg/dl at baseline level </td>
   <td style="text-align:left;color: #555 !important;"> [100, 140] </td>
   <td style="text-align:right;color: #555 !important;"> 134.1 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> mean serum creatinine level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Mean serum creatinine levels at baseline are between 3mg/dl and 15mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [3, 15] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 23.2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> mean serum prealbumin level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Mean serum pre-albumin levels at baseline are between 31mg/dl and 39mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [32, 39] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 23.7 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> normalized protein catabolic rate </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Average Normalized Protein Catabolic Rate is &lt; 1.2g/kg/day </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [0.00, 0.12] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 0.931 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> average bmi at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> Average BMI is between 18 and 24 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> [18, 24] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 24.9 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> mean age </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Mean age of participants is between 18 years to 20 years </td>
   <td style="text-align:left;color: #555 !important;"> [20, 80] </td>
   <td style="text-align:right;color: #555 !important;"> 44.4 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> nutritional counseling </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Most patients agreed to receiving nutritional counseling </td>
   <td style="text-align:left;color: #555 !important;"> [0.85, 0.99] </td>
   <td style="text-align:right;color: #555 !important;"> 0.889 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> proportion female participants </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Proportion female participants is half the participants till study conclusion </td>
   <td style="text-align:left;color: #555 !important;"> [0.25, 0.75] </td>
   <td style="text-align:right;color: #555 !important;"> 0.444 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> proportion male participants </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Proportion male participants is half the participants till study conclusion </td>
   <td style="text-align:left;color: #555 !important;"> [0.25, 0.75] </td>
   <td style="text-align:right;color: #555 !important;"> 0.556 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
</tbody>
</table>
