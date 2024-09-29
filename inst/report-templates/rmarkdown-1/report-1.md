---
title: Trawler Report
date: "Date: 2024-09-29 13:21:12.975852"
output:
  html_document:
    keep_md: true
    toc: true
    toc_float: true
    number_sections: true
    # css: ../analysis/common/styles-1.css
params:
  path_checks: "not-set"
---

<!-- div.main-container: The whole page -->
<!-- .col-md-3:          The left/side bar -->
<!-- div.tocify:         The TOC within the left/side bar -->
<style>
  div.main-container { width: 100%; max-width:100%; }
  .col-md-3          { width:  15%; }
  div.tocify         { width:  14%; }
</style>

<!-- Set the report-wide options, and point to the external code file. -->


<!-- Suppress the output when loading packages. -->


<!-- Load any global functions and variables declared in the R file.  Suppress the output. -->


<!-- Load the datasets.   -->


<!-- Tweak the datasets.   -->



Overview {.tabset .tabset-fade}
=============================

Instructions
-----------------------------

1. Work through each line in the table to discover & correct entry mistakes in the database.  Be aware that a single mistake may manifest in multiple rows/checks; fixing one value may clear several rows.
1. Click the `record id` value in a row to be taken to the participant's Event Grid in REDCap (*i.e.*, the 'stop light page').
1. Double-check that your manual corrections in REDCap are reflected in .  Be careful not to move this file to somewhere unsafe.
1. To help discover the dataflow and problematic location, use the
    * project's [codebook](https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/Design/data_dictionary_codebook.php?pid=1612) in REDCap,
    * the data pipeline files, and
    * the report code.
1. If you create a new rule or smell check, make sure the error message won't reveal any PHI.



Rules {.tabset .tabset-fade}
=============================

14 rules were examined. 8 rule(s) had at least 1 violation. 50 total violation(s) were found.

A *rule* is very exact.  Each record is examined to determine if it passes each specific rule.  The first tab summarizes the 14 defined for this dataset.  The second tab details the exact record and rule for each of the 50 violations.

Rule Summary
-----------------------------

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"check_name"` instead of `.data$check_name`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"priority"` instead of `.data$priority`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"error_message"` instead of `.data$error_message`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"violation_count"` instead of `.data$violation_count`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

<table class="table table-hover table-condensed table-responsive" style="color: black; width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Rule Name </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Priority </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Error Message </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Violation Count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> baseline prealbumin levels </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> Serum pre-albumin level of all enrolled patients do not meet the study criterion </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> hospitalization reason </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> Patient was hospitalized but reason and the date of hospitalization is missing </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> missing serum marker levels </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> Relevant nutritional serum markers are missing </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(241, 182, 218, 255) !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> npcr </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> NPCR at completion is missing </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> optimal daily protein intake </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> Daily protein intake is optimal but one of the nutritional marker is not within the normal range </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> recommended npcr range </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> NPCR values are not within the recommended range at completion </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> serum prealbumin levels 1 </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> serum prealbumin levels 2 </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Baseline prealbumin levels and pre-albumin levels during the 1st visit are not missing however levels in the next reading are missing </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> serum prealbumin levels completion data </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Baseline prealbumin levels are not missing however readings are not carefully monitored at completion </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> baseline first visit lab parameters </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 3 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Serum prealbumin levels are low and protein intake at baseline is less than optimal </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> daily first visit lab and workup parameters </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 3 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> In-addition to baseline &amp; visit lab protein parameters, blood work-up npcr levels are also low </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> daily protein intake </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 3 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> npcr levels in study have not improved as intended </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> npcr comparison </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 3 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> NPCR at completion is not greater than npcr at baseline </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> serum prealbumin levels expectations </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 3 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> serum prealbumin levels are not missing however subsequent readings did not come as expected </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0 </td>
  </tr>
</tbody>
</table>

Rule Detail
-----------------------------

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"results"` instead of `.data$results`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"record_id_linked"` instead of `.data$record_id_linked`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"data_collector"` instead of `.data$data_collector`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```
## Warning: Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
## ℹ Please use `"baseline_date"` instead of `.data$baseline_date`
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-251c3a49197f19f05d7a" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-251c3a49197f19f05d7a">{"x":{"filter":"top","vertical":false,"filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;baseline prealbumin levels&quot;,&quot;hospitalization reason&quot;,&quot;missing serum marker levels&quot;,&quot;npcr&quot;,&quot;npcr comparison&quot;,&quot;optimal daily protein intake&quot;,&quot;recommended npcr range&quot;,&quot;serum prealbumin levels 1&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"integer\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1\" data-max=\"3\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit&quot;,&quot;Daily protein intake is optimal but one of the nutritional marker is not within the normal range&quot;,&quot;NPCR at completion is missing&quot;,&quot;NPCR at completion is not greater than npcr at baseline&quot;,&quot;NPCR values are not within the recommended range at completion&quot;,&quot;Patient was hospitalized but reason and the date of hospitalization is missing&quot;,&quot;Relevant nutritional serum markers are missing&quot;,&quot;Serum pre-albumin level of all enrolled patients do not meet the study criterion&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;255&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"date\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1420156800000\" data-max=\"1427932800000\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","caption":"<caption>Violations at 2024-09-29 13:21:14.259411<\/caption>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"],["baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","missing serum marker levels","missing serum marker levels","missing serum marker levels","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","hospitalization reason","hospitalization reason","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","npcr","npcr comparison","npcr comparison"],[1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3],["Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Relevant nutritional serum markers are missing","Relevant nutritional serum markers are missing","Relevant nutritional serum markers are missing","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Patient was hospitalized but reason and the date of hospitalization is missing","Patient was hospitalized but reason and the date of hospitalization is missing","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR at completion is missing","NPCR at completion is not greater than npcr at baseline","NPCR at completion is not greater than npcr at baseline"],["<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=baseline_data\" target=\"_blank\">1<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=2&page=baseline_data\" target=\"_blank\">2<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=3&page=baseline_data\" target=\"_blank\">3<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=baseline_data\" target=\"_blank\">8<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=9&page=baseline_data\" target=\"_blank\">9<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=baseline_data\" target=\"_blank\">12<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=baseline_data\" target=\"_blank\">13<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=baseline_data\" target=\"_blank\">14<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=baseline_data\" target=\"_blank\">15<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=baseline_data\" target=\"_blank\">100<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=baseline_data\" target=\"_blank\">7<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=10&page=baseline_data\" target=\"_blank\">10<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=11&page=baseline_data\" target=\"_blank\">11<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=baseline_data, visit_lab_date\" target=\"_blank\">1<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=2&page=baseline_data, visit_lab_date\" target=\"_blank\">2<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=3&page=baseline_data, visit_lab_date\" target=\"_blank\">3<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=4&page=baseline_data, visit_lab_date\" target=\"_blank\">4<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=5&page=baseline_data, visit_lab_date\" target=\"_blank\">5<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=baseline_data, visit_lab_date\" target=\"_blank\">6<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=baseline_data, visit_lab_date\" target=\"_blank\">8<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=9&page=baseline_data, visit_lab_date\" target=\"_blank\">9<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=baseline_data, visit_lab_date\" target=\"_blank\">12<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=baseline_data, visit_lab_date\" target=\"_blank\">13<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=baseline_data, visit_lab_date\" target=\"_blank\">14<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=baseline_data, visit_lab_date\" target=\"_blank\">15<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=16&page=baseline_data, visit_lab_date\" target=\"_blank\">16<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=baseline_data, visit_lab_date\" target=\"_blank\">100<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=220&page=baseline_data, visit_lab_date\" target=\"_blank\">220<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_project_questionnaire\" target=\"_blank\">8<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=completion_project_questionnaire\" target=\"_blank\">14<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=5&page=completion_project_questionnaire, completion_data\" target=\"_blank\">5<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=completion_project_questionnaire, completion_data\" target=\"_blank\">6<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=completion_project_questionnaire, completion_data\" target=\"_blank\">7<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_project_questionnaire, completion_data\" target=\"_blank\">8<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=11&page=completion_project_questionnaire, completion_data\" target=\"_blank\">11<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=15&page=completion_project_questionnaire, completion_data\" target=\"_blank\">15<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=completion_project_questionnaire, completion_data\" target=\"_blank\">100<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=completion_data\" target=\"_blank\">1<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=6&page=completion_data\" target=\"_blank\">6<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=7&page=completion_data\" target=\"_blank\">7<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=8&page=completion_data\" target=\"_blank\">8<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=completion_data\" target=\"_blank\">12<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=13&page=completion_data\" target=\"_blank\">13<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=14&page=completion_data\" target=\"_blank\">14<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=16&page=completion_data\" target=\"_blank\">16<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=100&page=completion_data\" target=\"_blank\">100<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=220&page=completion_data\" target=\"_blank\">220<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=10&page=completion_data\" target=\"_blank\">10<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=1&page=completion_data\" target=\"_blank\">1<\/a>","<a href=\"https://bbmc.ouhsc.edu/redcap/redcap_v10.5.1/DataEntry/index.php?pid=1612&arm=1&id=12&page=completion_data\" target=\"_blank\">12<\/a>"],["1","2","3","1","3","3","1","1","3","1","2","255","2","1","2","3","255","1","3","1","3","3","1","1","3","2","1","1",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],["2015-01-02","2015-01-02","2015-01-05","2015-02-03","2015-02-08","2015-03-06","2015-03-15","2015-03-10","2015-03-03","2015-04-02","2015-01-27","2015-02-13","2015-02-19","2015-01-02","2015-01-02","2015-01-05","2015-01-10","2015-01-13","2015-01-16","2015-02-03","2015-02-08","2015-03-06","2015-03-15","2015-03-10","2015-03-03","2015-03-09","2015-04-02","2015-04-02",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Rule Name<\/th>\n      <th>Priority<\/th>\n      <th>Error Message<\/th>\n      <th>Record ID<\/th>\n      <th>Data Collector<\/th>\n      <th>Baseline Date<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":30,"dom":"tip","columnDefs":[{"className":"dt-center","targets":[5,6]},{"className":"dt-right","targets":2},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"Rule Name","targets":1},{"name":"Priority","targets":2},{"name":"Error Message","targets":3},{"name":"Record ID","targets":4},{"name":"Data Collector","targets":5},{"name":"Baseline Date","targets":6}],"initComplete":"function(settings, json) {\n$(this.api().table().header()).css({'background-color': '#555', 'color': '#fff'});\n}","order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true,"lengthMenu":[10,25,30,50,100]}},"evals":["options.initComplete"],"jsHooks":[]}</script>
```

Inactive Rules
-----------------------------

<div style="background-color:#555;color:white;padding:20px;">
1 rules(s) are disabled for this report:

1. pre_albumin_levels;

To enable/disable a rule, set the `active` element in the yaml checks file to "true" or "false".
</div>

Smells {.tabset .tabset-fade}
=============================

11 smells have been sniffed.  3 violation(s) were found.

A *smell* test won't validate a specific record (like the rules above), but it will make sure the overall dataset smells as expected.

Smell Summary
-----------------------------
<table class="table table-hover table-condensed table-responsive" style="color: black; width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Smell Name </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Priority </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> The dataset smells fresh when (the)... </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Legal Boundaries </th>
   <th style="text-align:right;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Value </th>
   <th style="text-align:left;font-weight: bold;color: white !important;background-color: rgba(85, 85, 85, 255) !important;"> Pass </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> definitive diagnosis </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> The proportion of study participants diagnosed with malnutrition associated with Chronic Renal Disease is 100% (*i.e.*, everyone) </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [1.00, 1.00] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1.00 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> dialysis adequacy </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Mean Kt/V value is within the normal range (*i.e.*, between 1.2 and 5) </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [1.2, 5.0] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1.92 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> normalized protein catabolic rate </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Mean Normalized Protein Catabolic Rate (nPCR) is &lt;= 1.2g/kg/day </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [0.0, 1.2] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0.931 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> serum cholesterol levels at baseline </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Mean cholesterol levels range is between 100 and 140mg/dl at baseline </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [100, 140] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 134.1 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> age </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Mean participant age is between 20 and 60 years </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [20, 60] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 44.4 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> bmi at baseline </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> Mean BMI is between 18 and 24 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> [18, 24] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 24.9 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> females </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Proportion of female participants is about half the sample </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [0.40, 0.60] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0.444 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> males </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Proportion of male participants is about half the sample </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [0.40, 0.60] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0.556 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> nutritional counseling </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> Most patients agreed to receiving nutritional counseling </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> [0.85, 0.99] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;"> 0.889 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> serum creatinine level at baseline </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> Mean serum creatinine level is between 3mg/dl and 15mg/dl at baseline </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> [3, 15] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 23.2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> serum prealbumin level at baseline </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 2 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> Mean serum pre-albumin level is between 31mg/dl and 39mg/dl at baseline </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> [32, 39] </td>
   <td style="text-align:right;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> 23.7 </td>
   <td style="text-align:left;color: rgba(85, 85, 85, 255) !important;font-weight: bold;background-color: rgba(253, 224, 239, 255) !important;"> FALSE </td>
  </tr>
</tbody>
</table>

Inactive Smells
-----------------------------

<div style="background-color:#555;color:white;padding:20px;">

1 smell(s) are disabled for this report:

1. average_serum_ferritin_levels_at_baseline;

To enable/disable a smell, set the `active` element in the yaml checks file to "true" or "false".
</div>

Configuration {.tabset .tabset-fade}
=============================

For the sake of documentation and reproducibility, the current report was rendered in the following environment.  Click the line below to expand.

<details>
  <summary>Environment <span class="glyphicon glyphicon-plus-sign"></span></summary>

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.4.1 (2024-06-14)
##  os       Ubuntu 24.04.1 LTS
##  system   x86_64, linux-gnu
##  ui       X11
##  language (EN)
##  collate  en_US.UTF-8
##  ctype    en_US.UTF-8
##  tz       America/Chicago
##  date     2024-09-29
##  pandoc   3.2 @ /usr/lib/rstudio/resources/app/bin/quarto/bin/tools/x86_64/ (via rmarkdown)
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date (UTC) lib source
##  backports     1.5.0   2024-05-23 [1] CRAN (R 4.4.0)
##  bslib         0.8.0   2024-07-29 [1] CRAN (R 4.4.1)
##  cachem        1.1.0   2024-05-16 [1] CRAN (R 4.4.0)
##  checkmate     2.3.2   2024-07-29 [1] CRAN (R 4.4.1)
##  cli           3.6.3   2024-06-21 [1] CRAN (R 4.4.1)
##  colorspace    2.1-1   2024-07-26 [1] CRAN (R 4.4.1)
##  crayon        1.5.3   2024-06-20 [1] CRAN (R 4.4.1)
##  crosstalk     1.2.1   2023-11-23 [1] CRAN (R 4.4.0)
##  digest        0.6.37  2024-08-19 [1] CRAN (R 4.4.1)
##  dplyr         1.1.4   2023-11-17 [1] CRAN (R 4.4.0)
##  DT            0.33    2024-04-04 [1] CRAN (R 4.4.0)
##  evaluate      1.0.0   2024-09-17 [1] CRAN (R 4.4.1)
##  fansi         1.0.6   2023-12-08 [1] CRAN (R 4.4.0)
##  fastmap       1.2.0   2024-05-15 [1] CRAN (R 4.4.0)
##  generics      0.1.3   2022-07-05 [1] CRAN (R 4.4.0)
##  glue          1.7.0   2024-01-09 [1] CRAN (R 4.4.0)
##  htmltools     0.5.8.1 2024-04-04 [1] CRAN (R 4.4.0)
##  htmlwidgets   1.6.4   2023-12-06 [1] CRAN (R 4.4.0)
##  jquerylib     0.1.4   2021-04-26 [1] CRAN (R 4.4.0)
##  jsonlite      1.8.9   2024-09-20 [1] CRAN (R 4.4.1)
##  kableExtra    1.4.0   2024-01-24 [1] CRAN (R 4.4.0)
##  knitr       * 1.48    2024-07-07 [1] CRAN (R 4.4.1)
##  lifecycle     1.0.4   2023-11-07 [1] CRAN (R 4.4.0)
##  magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.4.0)
##  munsell       0.5.1   2024-04-01 [1] CRAN (R 4.4.0)
##  pillar        1.9.0   2023-03-22 [1] CRAN (R 4.4.0)
##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.4.0)
##  purrr         1.0.2   2023-08-10 [1] CRAN (R 4.4.0)
##  R6            2.5.1   2021-08-19 [1] CRAN (R 4.4.0)
##  rlang         1.1.4   2024-06-04 [1] CRAN (R 4.4.0)
##  rmarkdown     2.28    2024-08-17 [1] CRAN (R 4.4.1)
##  rstudioapi    0.16.0  2024-03-24 [1] CRAN (R 4.4.0)
##  sass          0.4.9   2024-03-15 [1] CRAN (R 4.4.0)
##  scales        1.3.0   2023-11-28 [1] CRAN (R 4.4.0)
##  sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.4.0)
##  stringi       1.8.4   2024-05-06 [1] CRAN (R 4.4.0)
##  stringr       1.5.1   2023-11-14 [1] CRAN (R 4.4.0)
##  svglite       2.1.3   2023-12-08 [1] CRAN (R 4.4.0)
##  systemfonts   1.1.0   2024-05-15 [1] CRAN (R 4.4.0)
##  tibble        3.2.1   2023-03-20 [1] CRAN (R 4.4.0)
##  tidyr         1.3.1   2024-01-24 [1] CRAN (R 4.4.0)
##  tidyselect    1.2.1   2024-03-11 [1] CRAN (R 4.4.0)
##  utf8          1.2.4   2023-10-22 [1] CRAN (R 4.4.0)
##  vctrs         0.6.5   2023-12-01 [1] CRAN (R 4.4.0)
##  viridisLite   0.4.2   2023-05-02 [1] CRAN (R 4.4.0)
##  withr         3.0.1   2024-07-31 [1] CRAN (R 4.4.1)
##  xfun          0.47    2024-08-17 [1] CRAN (R 4.4.1)
##  xml2          1.3.6   2023-12-04 [1] CRAN (R 4.4.0)
##  yaml          2.3.10  2024-07-26 [1] CRAN (R 4.4.1)
## 
##  [1] /home/wibeasley/R/x86_64-pc-linux-gnu-library/4.4
##  [2] /usr/local/lib/R/site-library
##  [3] /usr/lib/R/site-library
##  [4] /usr/lib/R/library
## 
## ──────────────────────────────────────────────────────────────────────────────
```
</details>



Report rendered by wibeasley at 2024-09-29, 13:21 -0500 in 1 seconds.
