SELECT * FROM bam_in_gilead_hospital.patient; -- to view all data in the patients table
-- Q1 What is average age of patients visiting Bam in Gilead Hospitla?
select avg(age) as Averageage
from bam_in_gilead_hospital.patient;
-- The aveeage age of the patients is 41

-- Q2 How many patients has been diagnosed with hypertention?
select count(*) as Patientcount_Hypertention
from bam_in_gilead_hospital.patient
where diagnosis = 'Hypertension'; 
-- 27 pateints were diagnosed with Hypertension

-- Q3 Which region has the highest number of patients?
select region, count(*) as Patientcount
from bam_in_gilead_hospital.patient
group by region
order by patientcount desc;
-- The north has the hightest number of patients

-- Q4 What is the average cholesterol level for patients with diabetes?
select avg(cholesterol_mg_dl) as AvgCholesterol_diabetics
from bam_in_gilead_hospital.patient
where diagnosis ='Diabetes';
-- The average cholesterol for pateints with diabestes is 203

-- Q5 Which medication is prescribed most often?
 select medication,count(*) as Prescription_count
 from bam_in_gilead_hospital.patient
 where medication <> 'None'
 group by medication
 order by 2 desc;
 -- The most prescribed medication is Tamiflu
 
-- Q6 How patients visited the hospital in each month of the year? 
select month(str_to_date(visit_date, '%d/%m/%Y')) as monthnum,
	monthname(str_to_date(visit_date, '%d/%m/%Y')) as Visit_Month,
    count(*) as Patient_count
from bam_in_gilead_hospital.patient
group by monthnum, Visit_Month
order by monthnum;

-- Q7 What is the distribution of patients gender?
select gender, count(*) as patientcount
from bam_in_gilead_hospital.patient
group by gender;

set sql_safe_updates = 0;

update bam_in_gilead_hospital.patient
set gender = 'Male'
where patient_id = 99;
