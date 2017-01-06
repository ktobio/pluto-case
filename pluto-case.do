/********************************************************************************************
File        : pluto-case.do  <--- this should be the exact name of THIS document
Author      : Kristina Tobio 
Created     : 06 Jan 2016
Modified    : 06 Jan 2016
Description : .do file for Pluto Case
********************************************************************************************/

// these commands prepare your computer for the data and analysis
// this finds and closes open log files
capture log close        
// this clears Stata's data memory so new data can be loaded
clear       
// this makes it so you don't have to keep pressing return/enter to scroll through results
set more off          
// this sets memory size
set mem 100m       
// this keeps everything visible on a normal monitor or laptop screen
set linesize 200    

// cd means "change directory"
// you need to change this to the location on your computer where you are storing the .do and data files
*cd "/Users/ktobio/Desktop/Jeff/Course/Pluto Case/pluto-case" 
    
// this creates a log file, which will record all of the commands and outputs from this .do file 
// log files should be placed in a folder named "logs" in your directory 
log using "logs/pluto-case", replace

// data should be placed in a folder named "data" in your directory 

// this command reads the data into Stata
import excel using "data/pluto_rev.xls", firstrow sheet(212)

// this command saves it as a Stata file
save "data/pluto_rev.dta", replace

// drop missing
drop if id==.

// label variables
label var jdiw "Work Itself Scale"
label var jdis "Supervision Scale"
label var jdic "JDI Co-workers Scale"
label var jdipro "Promotion Scale"
label var msq "Minnesota Satisfaction Questionnaire"
label var psq "Pay Satisfaction Questionnaire"
label var under "Understanding of pay increase criteria"
label var influ "Perceived influence of supervisor over pay increases"
label var accur "Perceived accuracy of performance appraisal system"
label var imp1 "Perceived link between performance and promotions"
label var imp2 "Perceived link between performance and job security"
label var imp3 "Perceived link between performance and pay"
label var imp4 "Perceived link between performance and manager recognition"
label var imp5 "Perceived link between performance and peer recognition"
label var altemp "Perceived employment opportunities"
label var educ "Highest education level achieved"
label var div "Division of Pluto in which employee works"
label var perf "Average performance rating of employee over last 3 years" 
label var turn "Whether employee left the organization in the year following the survey (1=yes; 0=no)"
label var promo "Whether employee was promoted within last 3 years (1=yes; 0=no)"
label var merit "Average merit pay increase over past 3 years * 10"
label var mossr "Employee tenure at Pluto (in months)"
label var eeo "Race of employee (1=Black; 2=Asian; 3=American Indian; 4=Hispanic; 5=White)"
label var sex "Gender of employee (1=male; 2=female)"
label var age "Age of employee in years"
label var salary "Employee salary in dollars"

// label the values of some variables
label define labeldiv 1 "Manufacturing" 2 "Administrative staff" 3 "Research and development" 4 "New business development" 5 "Sales and marketing"
label values div labeldiv

label define labelperf 1 "unacceptable" 2 "somewhat below standards" 3 "average (meets standards)" 4 "above standards" 5 "exceptional"
label values perf labelperf

// Question 2
// How does the job satisfaction of our employees compare to those of comparable organizations?
// On p. 29 of the case, we have info about the comparable organizations.

// summary statistics for each of the variables
sum msq
sum psq
sum jdiw
sum jdic
sum jdis
sum jdipro

// Could create a dummy dataset of the comparable companies and have students do t-tests, is it meaningfully (statistically significantly) different?
/***********************************

set obs 398
gen compmsq=rnormal(73.72, 11.49)

***********************************/

// Question 3
// A. Within the company, are there any divisions whose employees have an attitude problem? Why?
// B. Within the company, are there any divisions whose employees are happy? Why?

stop


// closes your log
log close

// drops all data from Stata's memory
clear
