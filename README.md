# Identifying Subgroups of Children — PTM202 Study

## Executive Summary
The primary goal is investigating how PTM202 affects environmental enteric dysfunction (EED) in Bangladeshi Infants. Primarily, PTM202 was determined that it did not have an effect on EED. Our new goal is to determine if there is a subgroup of children who can benefit from the nutritional supplement and how to identify those children so that a targeted intervention can be developed. To perform LASSO and model-based tree methods, models with each of five response variables—WAZ, MPO, Reg1b, sCD14, and CRP—are fitted.

## Introduction
A randomized placebo control trial was conducted to determine how PTM202 affected environmental enteric dysfunction (EED) in Bangladeshi Infants. In the earlier study, PTM202 was determined that it did not have an effect on EED. The client-based interest of this report is to determine if there is a subgroup in which an effect was observed. The new goal is to determine if there is a subgroup of children who can benefit from the nutritional supplement and how to identify those children so that a targeted intervention can be developed.

## Data and Analysis
Since the trial was over a short period of time, weight is likely more useful than height. To measure how WAS has changed, I get difference values of WAZ5 (vtime = 5; Final) – WAZ2 (vtime = 2; Start of Intervention) from the anthropometric data. After omitting missing values, 178 out of 200 observations are left.

### 1. LASSO method
The Least Absolute Shrinkage and Selection Operator (LASSO) method shrinks less clear effects to zero and selects certain variables1. For instance, Figure 1 shows that a coefficient path at different L1 Norm values. The L1 norm is the regularization term for LASSO. If a L1 norm is small, we have a lot of regularization. As the L1 norm increases, coefficients of variables take nonzero values.

(need to add figures)

### 2. Model-based Trees
Next, I fit five models with response, treatment, and exploratory variables including additional variables (Table 1-1). Variables in the second column of Table 1-1 included as covariates.

(need to add figures)

## Summary
Based on the LASSO method, there is a subgroup defined by the water treatment for WAZ. Additionally, there are subgroups defined by the number of members in the household for MPO, the monthly total expenditure (in taka) for Reg1b, the number of living children and the number of people usually sleeping in the household for sCD14, and the parental education for CRP. Based on the visualization of the model-based trees, there are two subgroups defined by the family type (1: nuclear; 2: joint) for WAZ. However, there are no subgroups for the four inflammatory biomarkers. When WAZ is a response variable, treatment is positively related to weight in the nuclear families but negatively related in the joint families.
