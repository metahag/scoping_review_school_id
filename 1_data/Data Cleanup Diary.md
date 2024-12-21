*** Data cleanup for manually changed incorrect values:***
**in group designs - extracted data:** 
ID:
2302__psynthetic phonics treatment condition _i1: 12 weeks -->  participant’s classroom
831__pcontrol_conventional_i: frequency 5 --> 5 sessions
2229__pintervention group_i1: frequency 2 --> 2 or 3 sessions
28252__pIntervention group_i1: frequency 5-11 --> 5-11 instructional sessions
4214__pIntervention_i1: frequency 22 --> 22 sessions
5904__p_i1: 35 --> 35 music lessons
5986__pExperimental Group_i1: 48 --> four times a week
6344__p1_i1: 20 --> per day during 4 weeks (in total 20 school days)
6418__pIntervention Group_i1: 36 --> 36 lessons
6423__pIntervention Group_i1: 24 --> two 30-min sessions per week, for a total of 12 weeks.
695__p_i1: 8 --> 8 sessions
1225__pExperimental Group_i1: 15 --> 15 sessions
1395__p_i1: 5 --> 5 sessions
2095__pInterest-based Method_i1: 10 --> 10 sessions
2273__pIntervention_i1: 48 --> 48 sessions
2950__pExperimental Group_i1: 16 --> 16 sessions

-- at this point, the pattern for all numbers from X extractor is number of sessions, so that will be recoded in the categories sheet
16195__pintervention_i1: 18 --> 18 sessions
16335__pintervention_i1: 40 --> 40 sessions
7145__pintervention_i1: 2.5 --> 2-3 times a week
7182__pintervention_i1: 2 --> twice a week
7190__p_i1: 3 --> one session per day
7226__pintervention_music_i1: 24 --> 24 sessions
8001__pintervention_i1: 2 --> 2 a week
19027__pintervention_i1: 20-30 --> 20-30 sessions

**single case design - extracted data:**
1569__pstudent 2_i1: 65 --> 65 lessons
6473__pian_i1: NA --> daily
6070__psimon_i1: NA --> 3-4 times a week (full sample)
-- at this point, the pattern for all numbers from E extractor is number of sessions, so that will be recoded in the categories sheet
3104__pJustin_i1: 5 --> 5 times per week
-- at this point, the pattern for all numbers from MS extractor is number of sessions, so that will be recoded in the categories sheet
5901 - removed information from the first two rows relating to paraprofessional participants

-----------------------------------------------
***manually cleaned up data missing for sample size in the following studies after cleaning in R*** 

| Row Number | ID  | Count |
| ---------- | --- | ----- |

|   |   |   |
|---|---|---|
|1|#8932_|0|

|   |   |   |
|---|---|---|
|2|#7267_|0|

|   |   |   |
|---|---|---|
|3|#6700_|0|

|   |   |   |
|---|---|---|
|4|#6472_|0|

|   |   |   |
|---|---|---|
|5|#4073_|0|

|   |   |   |
|---|---|---|
|6|#40440_|0|

|   |   |   |
|---|---|---|
|7|#34666_|0|

|   |   |   |
|---|---|---|
|8|#32980_|0|

|   |   |   |
|---|---|---|
|9|#30753_|0|

|   |   |   |
|---|---|---|
|10|#30487_|0|

|   |   |   |
|---|---|---|
|11|#30388_|0|

|   |   |   |
|---|---|---|
|12|#28734_|0|

|   |   |   |
|---|---|---|
|13|#28714_|0|

|   |   |   |
|---|---|---|
|14|#27003_|0|

|   |   |   |
|---|---|---|
|15|#27002_|0|

|   |   |   |
|---|---|---|
|16|#26818_|0|

|   |   |   |
|---|---|---|
|17|#2395_|0|

|   |   |   |
|---|---|---|
|18|#21920_|0|

|   |   |   |
|---|---|---|
|19|#21906_|0|

|   |   |   |
|---|---|---|
|20|#2070_experiment 2|0|

|   |   |   |
|---|---|---|
|21|#19796_|0|

|   |   |   |
|---|---|---|
|22|#17321_|0|

|   |   |   |
|---|---|---|
|23|#17102_|0|

|   |   |   |
|---|---|---|
|24|#16970_study 2|0|

|   |   |   |
|---|---|---|
|25|#16195_|0|

|   |   |   |
|---|---|---|
|26|#1599_study 2|0|

|   |   |   |
|---|---|---|
|27|#14130_|0|

|   |   |   |
|---|---|---|
|28|#13562_|0|

|   |   |   |
|---|---|---|
|29|#12968_|0|

|   |   |   |
|---|---|---|
|30|#12915_|0|

|   |   |   |
|---|---|---|
|31|#12855_|0|

|     |         |     |
| --- | ------- | --- |
| 32  | #12257_ | 0   |

-----------------------------------------------
***Data cleanup for missing assigned study design found for the following studies in R and is fixed manually in the sheet***:
-- these were mutated in R, changed column is Design Category - I renamed RCT designs as RCT when they explicitly stated in the article that it was an RCT of any sort: changes were only made in the "intervention" sheet, not in the full study sheet
-- fixed A-B designs based on sample size - checked which ones are actually within designs incorrectly tagged as A-B (pre-post)

|Row Number|ID|Column 2|Column 3|Count|
|---|---|---|---|---|

|   |   |   |   |   |
|---|---|---|---|---|
|78|NA|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|906|#11189_|NA|NA|100|

|   |   |   |   |   |
|---|---|---|---|---|
|907|#15240_|NA|NA|4|

|   |   |   |   |   |
|---|---|---|---|---|
|908|#16970_study 2|NA|NA|3|

|   |   |   |   |   |
|---|---|---|---|---|
|909|#1799_study 2|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|910|#18559_|NA|NA|3|

|   |   |   |   |   |
|---|---|---|---|---|
|911|#19211_|NA|NA|5|

|   |   |   |   |   |
|---|---|---|---|---|
|912|#19393_|NA|NA|3|

|   |   |   |   |   |
|---|---|---|---|---|
|913|#20162_|NA|NA|43|

|   |   |   |   |   |
|---|---|---|---|---|
|914|#20577_|NA|NA|5|

|   |   |   |   |   |
|---|---|---|---|---|
|915|#2070_experiment 2|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|916|#20762_|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|917|#20926_|NA|NA|5|

|   |   |   |   |   |
|---|---|---|---|---|
|918|#2092_|NA|NA|20|

|   |   |   |   |   |
|---|---|---|---|---|
|919|#21280_|NA|NA|21|

|   |   |   |   |   |
|---|---|---|---|---|
|920|#21313_|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|921|#22718_|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|922|#2389_|NA|NA|3|

|   |   |   |   |   |
|---|---|---|---|---|
|923|#25351_experiment III|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|924|#2544_|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|925|#33377_|NA|NA|24|

|   |   |   |   |   |
|---|---|---|---|---|
|926|#4252_|NA|NA|30|

|   |   |   |   |   |
|---|---|---|---|---|
|927|#5026_|NA|NA|3|

|   |   |   |   |   |
|---|---|---|---|---|
|928|#5214_|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|929|#6102_|NA|NA|23|

|   |   |   |   |   |
|---|---|---|---|---|
|930|#6333_|NA|NA|1|

|   |   |   |   |   |
|---|---|---|---|---|
|931|#6632_|NA|NA|8|

|   |   |   |   |   |
|---|---|---|---|---|
|932|#6643_|NA|NA|240|

|   |   |   |   |   |
|---|---|---|---|---|
|933|#6681_|NA|NA|9|

|   |   |   |   |   |
|---|---|---|---|---|
|934|#6712_|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|935|#695_|NA|NA|11|

|   |   |   |   |   |
|---|---|---|---|---|
|936|#7304_|NA|NA|11|

|   |   |   |   |   |
|---|---|---|---|---|
|937|#7829_|NA|NA|2|

|   |   |   |   |   |
|---|---|---|---|---|
|938|#9340_|NA|NA|6|
-----------------------------------------------
***Data Cleanup of interventions whose rationale was not clearly specified*** 
added the "missing rationales" to studies that did not have that information extracted for the following:
[#602](https://drive.google.com/file/d/1eK53onTq-JfQw0XtGKSVhH7CYswg04Bw/view?usp=sharing)
[#1167](https://drive.google.com/file/d/1N-GZtinSUD41uzVOmitJ06AVdgOMA1DI/view?usp=drive_link)
[](https://drive.google.com/file/d/1EliGCzhHDyXWIaR3C8weZHyNn_X5wtfx/view?usp=drive_link)[#1811](https://drive.google.com/file/d/1EliGCzhHDyXWIaR3C8weZHyNn_X5wtfx/view?usp=drive_link)
[](https://drive.google.com/file/d/1u6VgTKE5goxB5sqoxy6LJS0RD4sQVM-5/view?usp=drive_link)[#2047](https://drive.google.com/file/d/1u6VgTKE5goxB5sqoxy6LJS0RD4sQVM-5/view?usp=drive_link)
[](https://drive.google.com/file/d/1hc5Fl2nNTJZi4HjL0DMCBXKi6r12xCsH/view?usp=drive_link)[#2715](https://drive.google.com/file/d/1hc5Fl2nNTJZi4HjL0DMCBXKi6r12xCsH/view?usp=drive_link)
[](https://drive.google.com/file/d/1Xf9Q30jmL9brq_gZpJIzXQL6C9zQ4TfW/view?usp=drive_link)[#5019](https://drive.google.com/file/d/1Xf9Q30jmL9brq_gZpJIzXQL6C9zQ4TfW/view?usp=drive_link)
[](https://drive.google.com/file/d/1znzOwRlH10QcDe8As_3KCy077RWcpjKk/view?usp=drive_link)[#5221](https://drive.google.com/file/d/1znzOwRlH10QcDe8As_3KCy077RWcpjKk/view?usp=drive_link)
[](https://drive.google.com/file/d/1_UwUQztxXtmL5Fu22y4CpxlNzkvRUV4K/view?usp=drive_link)[#15240](https://drive.google.com/file/d/1_UwUQztxXtmL5Fu22y4CpxlNzkvRUV4K/view?usp=drive_link)
[](https://drive.google.com/file/d/1UhckuYUDU8y5Qtv1O7bncfQpeEJbk6dn/view?usp=drive_link)[#6712](https://drive.google.com/file/d/1UhckuYUDU8y5Qtv1O7bncfQpeEJbk6dn/view?usp=drive_link)
[](https://drive.google.com/file/d/18rP1g3pdteC_lNApJpMXbMAPKRW5pVQA/view?usp=drive_link)[#4272](https://drive.google.com/file/d/18rP1g3pdteC_lNApJpMXbMAPKRW5pVQA/view?usp=drive_link)
[](https://drive.google.com/file/d/1_7l7b8EA-OlTKmpNwJjFq1F7q6R38gHS/view?usp=drive_link)[#9049](https://drive.google.com/file/d/1_7l7b8EA-OlTKmpNwJjFq1F7q6R38gHS/view?usp=drive_link)
[](https://drive.google.com/file/d/1xZW4rOeYB-zb7iLrYvPqgA3E0jIOYRbN/view?usp=drive_link)[#9337](https://drive.google.com/file/d/1xZW4rOeYB-zb7iLrYvPqgA3E0jIOYRbN/view?usp=drive_link)
[](https://drive.google.com/file/d/1loUHTKWzjdiWELwUNriCFGBMT_x0C-Qt/view?usp=drive_link)[#11346](https://drive.google.com/file/d/1loUHTKWzjdiWELwUNriCFGBMT_x0C-Qt/view?usp=drive_link)
[](https://drive.google.com/file/d/1qt7JV_Cwv7GbcBL3uEZANvIAsk8xsXfH/view?usp=drive_link)[#19442](https://drive.google.com/file/d/1qt7JV_Cwv7GbcBL3uEZANvIAsk8xsXfH/view?usp=drive_link)
[](https://drive.google.com/file/d/1qx8Gldk_wEGZ3Bytkm7W0efYsIdHiep_/view?usp=drive_link)[#22166](https://drive.google.com/file/d/1qx8Gldk_wEGZ3Bytkm7W0efYsIdHiep_/view?usp=drive_link)
[](https://drive.google.com/file/d/1Pfi7K9fQqBhwtDb4gGXM0qU1RwrZV2MF/view?usp=sharing)[#2741](https://drive.google.com/file/d/1Pfi7K9fQqBhwtDb4gGXM0qU1RwrZV2MF/view?usp=sharing)
[](https://drive.google.com/file/d/1OrZkTfo05WZ0Uo7cppuMj3uxaLIT3mpU/view?usp=sharing)[#13114](https://drive.google.com/file/d/1OrZkTfo05WZ0Uo7cppuMj3uxaLIT3mpU/view?usp=sharing)
[](https://drive.google.com/file/d/1mTen2o0QfPEzLBbE_H2FBMq-fY7Xumir/view?usp=sharing)[#17699](https://drive.google.com/file/d/1mTen2o0QfPEzLBbE_H2FBMq-fY7Xumir/view?usp=sharing)
[](https://drive.google.com/file/d/1a9Q4ByWlIOYoOL31uEFhPVz2QYZ-MlsV/view?usp=sharing)[#17842](https://drive.google.com/file/d/1a9Q4ByWlIOYoOL31uEFhPVz2QYZ-MlsV/view?usp=sharing)
[#3613](https://drive.google.com/file/d/1oVbYKgoACTb7ili5d5znahxE2Jd6zdhC/view?usp=sharing)
[#6846](https://drive.google.com/file/d/14GfYrIeru_aQH-m7ZHZ-qK_ekZ3Lshpm/view?usp=sharing)
[](https://drive.google.com/file/d/1iu-1-NTQNTBnQWKR-I2XPjqXo5Ejw91m/view?usp=drive_link)[#7031](https://drive.google.com/file/d/1iu-1-NTQNTBnQWKR-I2XPjqXo5Ejw91m/view?usp=drive_link)
[](https://drive.google.com/file/d/1vHoC6FeTP3Ug57-CRSh2SzXTOImcblQk/view?usp=sharing)[#7176](https://drive.google.com/file/d/1vHoC6FeTP3Ug57-CRSh2SzXTOImcblQk/view?usp=sharing)
[#36484](https://drive.google.com/file/d/1eXdoTXJra-LvOO0RnfpLZCX8ORxM0PoM/view?usp=sharing)
[#37055](https://drive.google.com/file/d/1U32Dv1E44af_6inHiVhvITe3VV475X-C/view?usp=sharing)
[](https://drive.google.com/file/d/1ujoT5_QnHoq9h9IT1wL0mL-2f4z-6zSE/view?usp=sharing)[#26782](https://drive.google.com/file/d/1ujoT5_QnHoq9h9IT1wL0mL-2f4z-6zSE/view?usp=sharing)
[](https://drive.google.com/file/d/1JVOg-X3ZO_q7RRiCZeUufNr03Etw0XKP/view?usp=sharing)[#28271](https://drive.google.com/file/d/1JVOg-X3ZO_q7RRiCZeUufNr03Etw0XKP/view?usp=sharing) 
[](https://drive.google.com/file/d/1-Dk0ov5q4w_N3RK9Yw9qr0pLxoeQVdiL/view?usp=sharing)[#27002](https://drive.google.com/file/d/1-Dk0ov5q4w_N3RK9Yw9qr0pLxoeQVdiL/view?usp=sharing)
[](https://drive.google.com/file/d/1E16VT0vCgV8ZTTX-Ph7EDJyGy8fkNpAa/view?usp=sharing)[#28714](https://drive.google.com/file/d/1E16VT0vCgV8ZTTX-Ph7EDJyGy8fkNpAa/view?usp=sharing)
[](https://drive.google.com/file/d/1eGX58BJHJ5naa15igD-IOjsE-xKvcyeY/view?usp=sharing)[#30406](https://drive.google.com/file/d/1eGX58BJHJ5naa15igD-IOjsE-xKvcyeY/view?usp=sharing)
[](https://drive.google.com/file/d/1AI0hPnGApDd_xfLNRr-PCwuB1AI77Amz/view?usp=sharing)[#30487](https://drive.google.com/file/d/1AI0hPnGApDd_xfLNRr-PCwuB1AI77Amz/view?usp=sharing)
[](https://drive.google.com/file/d/1iqkPUsakXdeyeOnnDsjAOF_-gopcFJPS/view?usp=sharing)[#30829](https://drive.google.com/file/d/1iqkPUsakXdeyeOnnDsjAOF_-gopcFJPS/view?usp=sharing)
[](https://drive.google.com/file/d/1M4o373A7E3DvzRQH6r3MZRP7WVLH321D/view?usp=sharing)[#33783](https://drive.google.com/file/d/1M4o373A7E3DvzRQH6r3MZRP7WVLH321D/view?usp=sharing)
[](https://drive.google.com/file/d/1zFjtt1ByJQS_6fjJiA94BI2TP7ZKWIs6/view?usp=sharing)[#17164](https://drive.google.com/file/d/1zFjtt1ByJQS_6fjJiA94BI2TP7ZKWIs6/view?usp=sharing)
[](https://drive.google.com/file/d/1aPtl0KqWueF9g8HuI83NC0qrbQuvepOZ/view?usp=sharing)[#27716](https://drive.google.com/file/d/1aPtl0KqWueF9g8HuI83NC0qrbQuvepOZ/view?usp=sharing)
[](https://drive.google.com/file/d/1a5MZjPCdDbNZy_QDSfkiibx-hbJ27gL7/view?usp=sharing)[#27687](https://drive.google.com/file/d/1a5MZjPCdDbNZy_QDSfkiibx-hbJ27gL7/view?usp=sharing)
[](https://drive.google.com/file/d/1s03XFSdrXZnV5ujkjVlmQiQH55bAKzG4/view?usp=drive_link)[#5075](https://drive.google.com/file/d/1s03XFSdrXZnV5ujkjVlmQiQH55bAKzG4/view?usp=drive_link) 
|[](https://drive.google.com/file/d/1Os3CaFmK_XhOZlgt-57W20eFIozxhoXb/view?usp=drive_link)[#5568](https://drive.google.com/file/d/1Os3CaFmK_XhOZlgt-57W20eFIozxhoXb/view?usp=drive_link)|
|[](https://drive.google.com/file/d/1Og0ZEwiYiSiCLBPk4SRao4x3qKORuT-j/view?usp=drive_link)[#5653](https://drive.google.com/file/d/1Og0ZEwiYiSiCLBPk4SRao4x3qKORuT-j/view?usp=drive_link)|
[](https://drive.google.com/file/d/1fYqibmAKI40jGghN08eeXKUWDk0yG7AK/view?usp=drive_link)[#8886](https://drive.google.com/file/d/1fYqibmAKI40jGghN08eeXKUWDk0yG7AK/view?usp=drive_link)
[](https://drive.google.com/file/d/1HNIUtL2XlPMqai-g_eKM8iv-zFi_j0sk/view?usp=drive_link)[#12393](https://drive.google.com/file/d/1HNIUtL2XlPMqai-g_eKM8iv-zFi_j0sk/view?usp=drive_link)
[](https://drive.google.com/file/d/1PFpS7DmCtjpfIBGhahw5s6fcFLohVAgD/view?usp=drive_link)[#23573](https://drive.google.com/file/d/1PFpS7DmCtjpfIBGhahw5s6fcFLohVAgD/view?usp=drive_link)
[](https://drive.google.com/file/d/1jlH4ix2_o1DUIsqfENKRos_MuLQDd2gT/view?usp=sharing)[#14306](https://drive.google.com/file/d/1jlH4ix2_o1DUIsqfENKRos_MuLQDd2gT/view?usp=sharing)
[](https://drive.google.com/file/d/13me7iSmkRdRyZxxATiDVuguCSZ_I8UB-/view?usp=sharing)[#7145](https://drive.google.com/file/d/13me7iSmkRdRyZxxATiDVuguCSZ_I8UB-/view?usp=sharing)
[](https://drive.google.com/file/d/1rIGRsA7KFbV6HLhkLB1EiYTEDw9AHhAe/view?usp=sharing)[#7182](https://drive.google.com/file/d/1rIGRsA7KFbV6HLhkLB1EiYTEDw9AHhAe/view?usp=sharing)
[](https://drive.google.com/file/d/1iPEC_Fle9AZBl4vpFAYIuPb6_b5ssGiK/view?usp=drive_link)[#7198](https://drive.google.com/file/d/1iPEC_Fle9AZBl4vpFAYIuPb6_b5ssGiK/view?usp=drive_link)
[](https://drive.google.com/file/d/1KWHU-ZIpnULt5dJBKC7x0SQhvaTfLv2-/view?usp=sharing)[#14455](https://drive.google.com/file/d/1KWHU-ZIpnULt5dJBKC7x0SQhvaTfLv2-/view?usp=sharing)
[](https://drive.google.com/file/d/1D6RMF9_mKQN7FPBOp2L5ELW-3DHW5Q7h/view?usp=sharing)[#40266](https://drive.google.com/file/d/1D6RMF9_mKQN7FPBOp2L5ELW-3DHW5Q7h/view?usp=sharing)
[](https://drive.google.com/file/d/1BjKYRtH_A-XFNPrf6ik4aNd8sgsJ63IT/view?usp=sharing)[#40415](https://drive.google.com/file/d/1BjKYRtH_A-XFNPrf6ik4aNd8sgsJ63IT/view?usp=sharing)
[](https://drive.google.com/file/d/1WjeW7BYWRt2Hl8GIS6DjQWp2jxJB-bU4/view?usp=sharing)[#40549](https://drive.google.com/file/d/1WjeW7BYWRt2Hl8GIS6DjQWp2jxJB-bU4/view?usp=sharing)
[](https://drive.google.com/file/d/1S_zm5dUvp2JSJTgCYVCk04myXFhW0lpN/view?usp=sharing)[#20794](https://drive.google.com/file/d/1S_zm5dUvp2JSJTgCYVCk04myXFhW0lpN/view?usp=sharing)
[](https://drive.google.com/file/d/1LCY6iZWyPoo9I9MU584ZGShqMrfPLcYv/view?usp=drive_link)[#45799](https://drive.google.com/file/d/1LCY6iZWyPoo9I9MU584ZGShqMrfPLcYv/view?usp=drive_link)
[](https://drive.google.com/file/d/1wBZy0zKWoQ4kpHyCh7IRZ4uWi4AWydiu/view?usp=drive_link)[#45927](https://drive.google.com/file/d/1wBZy0zKWoQ4kpHyCh7IRZ4uWi4AWydiu/view?usp=drive_link)

-----------------------------------------------
*** Data cleanup for rows which were incorrectly extracted in column one to the left of the correct column ***

|                                                                                                                |
| -------------------------------------------------------------------------------------------------------------- |
| #15232__pintervention_bubbles_i1_o1                                                                            |
| #15232__pintervention_memory_i1_o1                                                                             |
| #15232__pintervention_tangram_i1_o1                                                                            |
| #16195__pintervention_i1_o1                                                                                    |
| #16195__pcontrol_i1_o1                                                                                         |
| #16335__pintervention_i1_o1                                                                                    |
| #2031__pPablo : IDD level had incorrect values, transfered from diagnosis column - manually changed to correct |
| #2530__pScience moderate to severe --> moved to other and changed to mix                                       |

-----------------------------------------------
***Cleanup of participants who are not eligible based on IQ (>75)***

|                                                       |
| ----------------------------------------------------- |
| #2047__pMildred                                       |
| #29295__pZeb                                          |
| #29295__pJenna                                        |
| #5015__pDoug                                          |
| #5166__pAmanda                                        |
| #6720__pTodd                                          |
| #6720__pTravis                                        |
| #8160__pSarah                                         |
| #8160__pRita                                          |
| #20184__pShane                                        |
| #20184__pEric                                         |
| #21796__pJohn                                         |
| #21796__pTiffany                                      |
| #21796__pJack                                         |
| #21848__pJalen                                        |
| #3185__pKaylie                                        |
| #3185__pBrittany                                      |
| #3185__pHugh                                          |
| #3290__pHillary                                       |
| #3290__pTristan                                       |
| #22666__pIntervention group                           |
| #1395__p                                              |
| #35314__pintervention_ld<br>#13236__pintervention_wmr |

-----------------------------------------------
***Data cleanup - changed to reflect the extracted sample size, and filter the ineligible participants in the sample size in R later:***

| #29295__pZeb      | Zeb       | m      | Multiple disabilities   | 1   |
| ----------------- | --------- | ------ | ----------------------- | --- |
| #29295__pJenna    | Jenna     | f      |                         | 1   |
| #29295__pSam      | Sam       | m      |                         | 1   |
| #29295__pNancy    | Nancy     | f      |                         | 1   |
| #5015__pKelly     | Kelly     | f      | Intellectual disability | 1   |
| #5015__pMiles     | Miles     | m      |                         | 1   |
| #5015__pDoug      | Doug      | m      |                         | 1   |
| #5166__pAmanda    | Amanda    | f      | Multiple disabilities   | 1   |
| #5166__p          |           |        |                         |     |
| #5166__p          |           |        |                         |     |
| #5166__pErica     | Erica     | m      |                         | 1   |
| #5166__p          |           |        |                         |     |
| #5166__p          |           |        |                         |     |
| #5166__pNick      | Nick      | f      |                         | 1   |
| #5166__p          |           |        |                         |     |
| #5166__p          |           |        |                         |     |
| #5166__pGerald    | Gerald    | m      |                         | 1   |
| #5166__p          |           |        |                         |     |
| #5166__p          |           |        |                         |     |
| #6720__pMason     | Mason     | m      | Intellectual disability | 1   |
| #6720__pTodd      | Todd      | m      |                         | 1   |
| #6720__pTravis    | Travis    | m      |                         | 1   |
| #8160__pDeborah   | Deborah   | f      | Intellectual disability | 1   |
| #8160__pSarah     | Sarah     | f      |                         | 1   |
| #8160__pRita      | Rita      | f      |                         | 1   |
| #8160__pMatt      | Matt      | m      |                         | 1   |
| #20184__pShane    | Shane     | m      |                         | 1   |
| #20184__pAngel    | Angel     | m      |                         | 1   |
| #20184__pEric     | Eric      | m      |                         | 1   |
| #21796__pJohn     | John      | m      |                         | 1   |
| #21796__pTiffany  | Tiffany   | f      |                         | 1   |
| #21796__pJack     | Jack      | m      |                         | 1   |
| #21848__pJalen    | Jalen     | m      | Multiple disabilities   | 1   |
| #21848__pKoby     | Koby      | m      |                         | 1   |
| #21848__pBerto    | Berto     | m      |                         | 1   |
| #3185__pHarold    | Harold    | Male   | Multiple disabilities   | 1   |
| #3185__pJordan    | Jordan    | Male   |                         | 1   |
| #3185__pKaylie    | Kaylie    | Female |                         | 1   |
| #3185__pBrittany  | Brittany  | Female |                         | 1   |
| #3185__pMaya      | Maya      | Female |                         | 1   |
| #3185__pHugh      | Hugh      | Male   |                         | 1   |
| #6219__pKya       | Kya       | Female | Multiple disabilities   | 3   |
| #6219__pEli       | Eli       | Male   |                         |     |
| #6219__pCole      | Cole      | Male   |                         |     |
| #6725__pEvie      | Evie      | NA     | Multiple disabilities   | 4   |
| #6725__pAustin    | Austin    | NA     |                         |     |
| #6725__pVicky     | Vicky     | NA     |                         |     |
| #6725__pRisa      | Risa      | NA     |                         |     |
| #1740__pStudent 1 | Student 1 | Male   | Multiple disabilities   | 3   |
| #1740__pStudent 3 | Student 3 | Female |                         |     |
| #1740__pStudent 6 | Student 6 | Female |                         |     |
| #17646__pKhafila  | Khafila   | Female | Multiple disabilities   | 1   |
| #1905__pStudent 1 | Student 1 | Female | Multiple disabilities   | 1   |
| #3185__pHarold    | Harold    | Male   | Multiple disabilities   | 1   |
| #3185__pJordan    | Jordan    | Male   |                         | 1   |
| #3185__pKaylie    | Kaylie    | Female |                         | 1   |
| #3185__pBrittany  | Brittany  | Female |                         | 1   |
| #3185__pMaya      | Maya      | Female |                         | 1   |
| #3185__pHugh      | Hugh      | Male   |                         | 1   |


|Row Number|ID|Count|
|---|---|---|

|   |   |   |
|---|---|---|
|1|#8932_|0|

|   |   |   |
|---|---|---|
|2|#7267_|0|

|   |   |   |
|---|---|---|
|3|#6700_|0|

|   |   |   |
|---|---|---|
|4|#6472_|0|

|   |   |   |
|---|---|---|
|5|#4073_|0|

|   |   |   |
|---|---|---|
|6|#40440_|0|

|   |   |   |
|---|---|---|
|7|#34666_|0|

|   |   |   |
|---|---|---|
|8|#32980_|0|

|   |   |   |
|---|---|---|
|9|#30753_|0|

|   |   |   |
|---|---|---|
|10|#30487_|0|

|   |   |   |
|---|---|---|
|11|#30388_|0|

|   |   |   |
|---|---|---|
|12|#28734_|0|

|   |   |   |
|---|---|---|
|13|#28714_|0|

|   |   |   |
|---|---|---|
|14|#27003_|0|

|   |   |   |
|---|---|---|
|15|#27002_|0|

|   |   |   |
|---|---|---|
|16|#26818_|0|

|   |   |   |
|---|---|---|
|17|#2395_|0|

|   |   |   |
|---|---|---|
|18|#21920_|0|

|   |   |   |
|---|---|---|
|19|#21906_|0|

|   |   |   |
|---|---|---|
|20|#2070_experiment 2|0|

|   |   |   |
|---|---|---|
|21|#19796_|0|

|   |   |   |
|---|---|---|
|22|#17321_|0|

|   |   |   |
|---|---|---|
|23|#17102_|0|

|   |   |   |
|---|---|---|
|24|#16970_study 2|0|

|   |   |   |
|---|---|---|
|25|#16195_|0|

|   |   |   |
|---|---|---|
|26|#1599_study 2|0|

|   |   |   |
|---|---|---|
|27|#14130_|0|

|   |   |   |
|---|---|---|
|28|#13562_|0|

|   |   |   |
|---|---|---|
|29|#12968_|0|

|   |   |   |
|---|---|---|
|30|#12915_|0|

|   |   |   |
|---|---|---|
|31|#12855_|0|

|   |   |   |
|---|---|---|
|32|#12257_|0|

*** Data cleanup - missing study design ***
|   |   |   |
|---|---|---|
|1|#10278_|| - unclear design
|2|#11189_|| - missing within
|3|#16970_study 2|| - missed assigning to both studies within report
|4|#1799_study 2|| - missed assigning to both studies within report
|5|#18559_|| - missing A-B
|6|#19040_|| - missing other group
|7|#19211_||- missing multiple probe
|8|#19393_|| - missing alternating treatment
|9|#20162_|| - other group design
|10|#20577_|| - not missing
|11|#2070_experiment 2|| - missed assigning to both studies within report
|12|#20762_|| - other SCD
|13|#20926_|| - other SCD
|14|#2092_|| - missed pre post control design
|15|#21280_|| - missed pre post control design
|16|#21313_|| - other SCD
|17|#22718_|| - missed multiple baseline
|18|#23766_|| - missed Atd
|19|#33377_|| - missed mixed
|20|#4252_|| - missed within
|21|#5026_|| - missed multiple probe
|22|#5214_|| - missed atd
|23|#6102_|| - missed mixed
|24|#6333_|| - missed other scd
|25|#6632_|| - missed other scd
|26|#6643_|| - missed other group
|27|#6681_|| - missed within 
|28|#6712_|| - missed other scd
|29|#695_|| - missed within
|30|#7829_|| - missed multiple probe
|31|#9340_|| - missed within


categorised these extracted as other to clearer categories:
#31609_
Multiple Probe Design|Other
778
#40468_
Multiple Probe Design|Other
779
#7176_
Multiple Probe Design|Other
780
#19211_
Other
781
#19393_
Other
782
#2092_
Other
783
#2389_
Other
784
#25351_experiment III
Other
785
#2544_
Other
786
#6503_
Other
787
#695_
Other
788
#7304_
Other

***Fixed extraction of eligible participants***
ID: 22666 - had extracted all participants, but only two eligible participants. - scores changed to 64 and 75 instead of 64-122 and age and grade changed appropriately, the rest of extraction is unchanged


*** Mising standardization information ***
#2047_
NA
Multiple Baseline Design
Single-Case Design
946
#12931_
NA
A-B Design (Pre-Post Design)
Single-Case Design
947
#5131_
NA
Multiple Probe Design
Single-Case Design
948
#5200_
NA
Multiple Baseline Design
Single-Case Design
949
#5455_
NA
Multiple Baseline Design
Single-Case Design
950
#5559_
NA
Multiple Probe Design
Single-Case Design
951
#4365_
NA
Multiple Probe Design
Single-Case Design
952
#4419_
NA
Multiple Probe Design
Single-Case Design
953
#4470_
NA
Multiple Probe Design
Single-Case Design
954
#8389_
NA
Multiple Probe Design
Single-Case Design
955
#9617_
NA
Alternating Treatments Design
Single-Case Design
956
#9707_
NA
A-B Design (Pre-Post Design)
Single-Case Design
957
#9782_
NA
Multiple Baseline Design
Single-Case Design
958
#9879_
NA
Alternating Treatments Design
Single-Case Design
959
#10278_
NA
Other Single-case Design
Single-Case Design
960
#10446_
NA
A-B Design (Pre-Post Design)
Single-Case Design
961
#10462_
NA
Alternating Treatments Design
Single-Case Design
962
#10485_
NA
Multiple Probe Design
Single-Case Design
963
#10857_
NA
Other Single-case Design
Single-Case Design
964
#20139_
NA
Other Single-case Design
Single-Case Design
965
#21157_
NA
A-B-A (or A-B-A-B) Design (Reversal Design)
Single-Case Design
966
#21227_
NA
Alternating Treatments Design
Single-Case Design
967
#21561_
NA
Multiple Probe Design
Single-Case Design
968
#21796_
NA
Multiple Probe Design
Single-Case Design
969
#23909_
NA
Multiple Probe Design
Single-Case Design
970
#6217_
NA
Multiple Baseline Design
Single-Case Design
971
#6498_
NA
Multiple Probe Design
Single-Case Design
972
#1252_
NA
Alternating Treatments Design
Single-Case Design
973
#1799_study 1
NA
Multiple Probe Design
Single-Case Design
974
#1799_study 2
NA
Multiple Probe Design
Single-Case Design
975
#16970_study 2
NA
Multiple Baseline Design
Single-Case Design
976
#40314_
NA
Other Single-case Design
Single-Case Design
977
#31678_study_two
NA
Multiple Probe Design
Single-Case Design
978
#31678_study_three
NA
Multiple Probe Design
Single-Case Design
979
#12915_
NA
Between participants
Group Design
980
#28643_
NA
Between participants
Group Design
981
#5183_
NA
Quasi-experimental Design
Group Design
982
#5357_
NA
Pre-Post Comparison Design
Group Design
983
#4600_
NA
Within participants
Group Design
984
#9020_
NA
Between participants
Group Design
985
#10147_
NA
Pre-Post Comparison Design
Group Design
986
#14104_
NA
Pre-Post Comparison Design
Group Design
987
#14851_
NA
Pre-Post Comparison Design
Group Design
988
#15232_
NA
Within participants
Group Design
989
#7028_
NA
Within participants
Group Design
990
#1556_
NA
Pre-Post Comparison Design
Group Design
991
#45763_
NA
Multiple Baseline Design
Single-Case Design

*** Cleaned missing population of interest ***
	
covidence_id
population_of_interest
1
#3363
NA
2
#5133
NA
3
#4898
NA
4
#5078
NA
5
#5223
NA
6
#15240
NA
7
#5440
NA
8
#5559
NA
9
#5787
NA
10
#4320
NA
11
#4648
NA
12
#9337
NA
13
#10462
NA
14
#11373
NA
15
#11571
NA
16
#19107
NA
17
#19307
NA
18
#19671
NA
19
#20184
NA
20
#21796
NA
21
#22166
NA
22
#22559
NA
23
#22672
NA
24
#23766
NA
25
#5177
NA
26
#5183
NA
27
#5357
NA
28
#5568
NA
29
#6565
NA
30
#6603
NA
31
#11296
NA
32
#21984
NA
33
#23743
NA
34
#5921
NA

***fixed values after interrater reliability***
6700 - neither extracted the correct value, changed to 22 in the dataset
5986 - fixed from 110 to 60 as the final sample and the gender number is missing in that case
---------------------
14116 - pre-post comparison, not a-b
5833 - pre-post comparison, not within or between
5812 - pre-post comparison
5455 - multiple probe design
--------------------
2030 - author implemented
5764 - it's teacher and investigators instruct
6688 - teacher instruct
5785 - researcher instruct
--------------------
5275 - done in USA
6439 - unclear where it was done
-------------------
5328 - Researcher examiner
5358 - Teacher and Research Assistant examiner
5787 - Two teachers examiner
5815 - special education teacher examiner
5832 - authors examiner
6688 - teacher examiner
6498 - first author and peer tutor examiner
5833 - two Evaluators examiner
5836 - NA examiner
14116 - NA
5986 - yes standardized
---------------
5440 - engagement outcome
6597 - changed outcome, operationalization and measure
5415 - changed category to academic and psychological
6632 - social category
6498 - other (physical) category
6603 - psychological category
--------------
5769 - classroom
5214 - Special education classroom at a kidney‐shaped table
5221 - empty classroom in each school to eliminate distractions from other students and to provide privacy
5274 - The study took place in a teacher workroom down the hall from the participants’ special education clas
5275 - quiet setting away from the classroom
5336 - self-contained special education clasroom
5356 - "Due to high noise levels and limited space in the cafeteria, each facilitator opted to find another location (e.g., open lobby space near the cafeteria)"
5445 - general education classroom
5530 - conducted in the classroom and the school yard during non-academic activities
5777 - classroom
6560 - classrooms
5568 - Classroom
6700 - classroom
--------------
5214 - not reported
6489 - mix
5357 - mix
-----------
6688 - "(students with intellectual disabilities and students with hearing impairment) "



