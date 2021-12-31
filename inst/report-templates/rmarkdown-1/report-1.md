---
title: Trawler Report
date: "Date: 2021-12-31 14:33:07"
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

<style>
  div.main-container { width: 100%; max-width:100%; }
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

Inactive Checks
-----------------------------

1 rules(s) are disabled for this report: 

1. pre_albumin_levels;

0 smell(s) are disabled for this report: 



Rules {.tabset .tabset-fade}
=============================

14 rules were examined. 8 rule(s) had at least 1 violation. 50 total violation(s) were found.

A *rule* is very exact.  Each record is examined to determine if it passes each specific rule.  The first tab summarizes the 14 defined for this dataset.  The second tab details the exact record and rule for each of the 50 violations.

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
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> baseline prealbumin levels </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Serum pre-albumin level of all enrolled patients do not meet the study criterion </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> hospitalization reason </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Patient was hospitalized but reason and the date of hospitalization is missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> missing serum marker levels </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Relevant nutritional serum markers are missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> npcr </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> NPCR at completion is missing </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> optimal daily protein intake </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> Daily protein intake is optimal but one of the nutritional marker is not within the normal range </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> recommended npcr range </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> NPCR values are not within the recommended range at completion </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> serum prealbumin levels 1 </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum prealbumin levels 2 </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Baseline prealbumin levels and pre-albumin levels during the 1st visit are not missing however levels in the next reading are missing </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum prealbumin levels completion data </td>
   <td style="text-align:right;color: #555 !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;"> Baseline prealbumin levels are not missing however readings are not carefully monitored at completion </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> baseline first visit lab parameters </td>
   <td style="text-align:right;color: #555 !important;"> 3 </td>
   <td style="text-align:left;color: #555 !important;"> Serum prealbumin levels are low and protein intake at baseline is less than optimal </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> daily first visit lab and workup parameters </td>
   <td style="text-align:right;color: #555 !important;"> 3 </td>
   <td style="text-align:left;color: #555 !important;"> In-addition to baseline &amp; visit lab protein parameters, blood work-up npcr levels are also low </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> daily protein intake </td>
   <td style="text-align:right;color: #555 !important;"> 3 </td>
   <td style="text-align:left;color: #555 !important;"> npcr levels in study have not improved as intended </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> npcr comparison </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 3 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> NPCR at completion is not greater than npcr at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> serum prealbumin levels expectations </td>
   <td style="text-align:right;color: #555 !important;"> 3 </td>
   <td style="text-align:left;color: #555 !important;"> serum prealbumin levels are not missing however subsequent readings did not come as expected </td>
   <td style="text-align:right;color: #555 !important;"> 0 </td>
  </tr>
</tbody>
</table>

Rule Detail
-----------------------------

```{=html}
<div id="htmlwidget-028c0ce1ed7b7f447d23" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-028c0ce1ed7b7f447d23">{"x":{"filter":"top","vertical":false,"filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;baseline prealbumin levels&quot;,&quot;hospitalization reason&quot;,&quot;missing serum marker levels&quot;,&quot;npcr&quot;,&quot;npcr comparison&quot;,&quot;optimal daily protein intake&quot;,&quot;recommended npcr range&quot;,&quot;serum prealbumin levels 1&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"integer\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1\" data-max=\"3\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit&quot;,&quot;Daily protein intake is optimal but one of the nutritional marker is not within the normal range&quot;,&quot;NPCR at completion is missing&quot;,&quot;NPCR at completion is not greater than npcr at baseline&quot;,&quot;NPCR values are not within the recommended range at completion&quot;,&quot;Patient was hospitalized but reason and the date of hospitalization is missing&quot;,&quot;Relevant nutritional serum markers are missing&quot;,&quot;Serum pre-albumin level of all enrolled patients do not meet the study criterion&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"integer\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1\" data-max=\"220\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"factor\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"width: 100%; display: none;\">\n      <select multiple=\"multiple\" style=\"width: 100%;\" data-options=\"[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;255&quot;]\"><\/select>\n    <\/div>\n  <\/td>\n  <td data-type=\"date\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1420156800000\" data-max=\"1427932800000\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","caption":"<caption>Violations at 2021-12-31 14:33:08<\/caption>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"],["baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","baseline prealbumin levels","missing serum marker levels","missing serum marker levels","missing serum marker levels","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","serum prealbumin levels 1","hospitalization reason","hospitalization reason","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","optimal daily protein intake","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","recommended npcr range","npcr","npcr comparison","npcr comparison"],[1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3],["Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Serum pre-albumin level of all enrolled patients do not meet the study criterion","Relevant nutritional serum markers are missing","Relevant nutritional serum markers are missing","Relevant nutritional serum markers are missing","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Baseline prealbumin levels are not missing however levels were not carefully monitored in the subsequent visit","Patient was hospitalized but reason and the date of hospitalization is missing","Patient was hospitalized but reason and the date of hospitalization is missing","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","Daily protein intake is optimal but one of the nutritional marker is not within the normal range","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR values are not within the recommended range at completion","NPCR at completion is missing","NPCR at completion is not greater than npcr at baseline","NPCR at completion is not greater than npcr at baseline"],[1,2,3,8,9,12,13,14,15,100,7,10,11,1,2,3,4,5,6,8,9,12,13,14,15,16,100,220,8,14,5,6,7,8,11,15,100,1,6,7,8,12,13,14,16,100,220,10,1,12],["1","2","3","1","3","3","1","1","3","1","2","255","2","1","2","3","255","1","3","1","3","3","1","1","3","2","1","1",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],["2015-01-02","2015-01-02","2015-01-05","2015-02-03","2015-02-08","2015-03-06","2015-03-15","2015-03-10","2015-03-03","2015-04-02","2015-01-27","2015-02-13","2015-02-19","2015-01-02","2015-01-02","2015-01-05","2015-01-10","2015-01-13","2015-01-16","2015-02-03","2015-02-08","2015-03-06","2015-03-15","2015-03-10","2015-03-03","2015-03-09","2015-04-02","2015-04-02",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Rule Name<\/th>\n      <th>Priority<\/th>\n      <th>Error Message<\/th>\n      <th>Record ID<\/th>\n      <th>Data Collector<\/th>\n      <th>Baseline Date<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":30,"dom":"tip","columnDefs":[{"className":"dt-center","targets":[5,6]},{"className":"dt-right","targets":[2,4]},{"orderable":false,"targets":0}],"initComplete":"function(settings, json) {\n$(this.api().table().header()).css({'background-color': '#555', 'color': '#fff'});\n}","order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true,"lengthMenu":[10,25,30,50,100]}},"evals":["options.initComplete"],"jsHooks":[]}</script>
```

Smells {.tabset .tabset-fade}
=============================

12 smells have been sniffed.  4 violation(s) were found.

A *smell* test won't validate a specific record (like the rules above), but it will make sure the dataset overall smells as expected.

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
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> mean serum creatinine level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> Mean serum creatinine levels at baseline are between 3mg/dl and 15mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> [3, 15] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 23.2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> mean serum prealbumin level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 2 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> Mean serum pre-albumin levels at baseline are between 31mg/dl and 39mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> [32, 39] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> 23.7 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #fde0ef !important;"> FALSE </td>
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
