---
title: REDCapR Validator Example 1     # Change this value for new validators.
date: "Date: 2021-12-29 17:49:10"
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


<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of three directories.-->


<!-- Set the report-wide options, and point to the external code file. -->


<!-- Load 'sourced' R files.  Suppress the output when loading packages. -->


<!-- Load any global functions and variables declared in the R file.  Suppress the output. -->


<!-- Load the datasets.   -->


<!-- Tweak the datasets.   -->



Smells {.tabset .tabset-fade}
=============================

A *smell* test won't validate a specific record (like the rules below), but it will make sure the dataset overall smells correct.

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
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> average bmi at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Average BMI is between 18 and 24 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [18.00, 24.00] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 24.8500 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> average serum ferritin levels at baseline </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Mean serum ferritin levels are in the recommended range of &gt; 500ng/dl-1200ng/dl </td>
   <td style="text-align:left;color: #555 !important;"> [501, 1200] </td>
   <td style="text-align:right;color: #555 !important;"> 589.12 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> definitive diagnosis </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> A 100 percent of study participants were diagnosed with malnutrition associated with Chronic Renal Disease </td>
   <td style="text-align:left;color: #555 !important;"> [1.00, 1.00] </td>
   <td style="text-align:right;color: #555 !important;"> 1.0000 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> dialysis adequacy </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Normal range for Kt/V values are between 1.2 and 5 </td>
   <td style="text-align:left;color: #555 !important;"> [1.20, 5.00] </td>
   <td style="text-align:right;color: #555 !important;"> 1.9167 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> mean age </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Mean age of participants is between 18 years to 20 years </td>
   <td style="text-align:left;color: #555 !important;"> [20.00, 80.00] </td>
   <td style="text-align:right;color: #555 !important;"> 44.3889 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> mean serum cholesterol levels at baseline </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Average Cholesterol levels range is between 100mg/dl-140mg/dl at baseline level </td>
   <td style="text-align:left;color: #555 !important;"> [100.00, 140.00] </td>
   <td style="text-align:right;color: #555 !important;"> 134.1176 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> mean serum creatinine level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Mean serum creatinine levels at baseline are between 3mg/dl and 15mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [3.00, 15.00] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 23.1687 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> mean serum prealbumin level at baseline </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Mean serum pre-albumin levels at baseline are between 31mg/dl and 39mg/dl </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [32.00, 39.00] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 23.6667 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> normalized protein catabolic rate </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Average Normalized Protein Catabolic Rate is &lt; 1.2g/kg/day </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [0.00, 0.12] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 0.9313 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;"> nutritional counseling </td>
   <td style="text-align:right;color: #555 !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;"> Most patients agreed to receiving nutritional counseling </td>
   <td style="text-align:left;color: #555 !important;"> [0.85, 0.99] </td>
   <td style="text-align:right;color: #555 !important;"> 0.8889 </td>
   <td style="text-align:left;color: #555 !important;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> proportion female participants </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Proportion female participants is half the participants till study conclusion </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [0.50, 0.50] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 0.4444 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
  <tr>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> proportion male participants </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 1 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> Proportion male participants is half the participants till study conclusion </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> [0.50, 0.50] </td>
   <td style="text-align:right;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> 0.5556 </td>
   <td style="text-align:left;color: #555 !important;font-weight: bold;background-color: #f1b6da !important;"> FALSE </td>
  </tr>
</tbody>
</table>
