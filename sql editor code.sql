CREATE DATABASE HospitalManagementSystem;

USE HospitalManagementSystem;

CREATE TABLE Department65733 (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL,
location VARCHAR(50)
);

CREATE TABLE Doctor65733 (
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(50) NOT NULL,
specialization VARCHAR(50),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id)
REFERENCES Department65733(dept_id)
);

CREATE TABLE Patient65733 (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(50) NOT NULL,
gender VARCHAR(10),
age INT,
phone VARCHAR(20)
);

CREATE TABLE Appointment65733 (
app_id INT PRIMARY KEY,
app_date DATE,
patient_id INT,
doctor_id INT,
FOREIGN KEY (patient_id)
REFERENCES Patient65733(patient_id),
FOREIGN KEY (doctor_id)
REFERENCES Doctor65733(doctor_id)
);

CREATE TABLE Billing65733 (
bill_id INT PRIMARY KEY,
patient_id INT,
amount INT,
payment_date DATE,
FOREIGN KEY (patient_id)
REFERENCES Patient65733(patient_id)
);

INSERT INTO Department65733 VALUES (1,'Cardiology','Block A');
INSERT INTO Department65733 VALUES (2,'Neurology','Block B');
INSERT INTO Department65733 VALUES (3,'Orthopedic','Block C');

INSERT INTO Doctor65733 VALUES (101,'Dr Ali','Cardiologist',80000,1);
INSERT INTO Doctor65733 VALUES (102,'Dr Sara','Neurologist',75000,2);
INSERT INTO Doctor65733 VALUES (103,'Dr Ahmed','Orthopedic',70000,3);

INSERT INTO Patient65733 VALUES (201,'Usman','Male',22,'03001234567');
INSERT INTO Patient65733 VALUES (202,'Hina','Female',20,'03111234567');
INSERT INTO Patient65733 VALUES (203,'Bilal','Male',25,'03221234567');

INSERT INTO Appointment65733 VALUES (301,CURDATE(),201,101);
INSERT INTO Appointment65733 VALUES (302,CURDATE(),202,102);
INSERT INTO Appointment65733 VALUES (303,CURDATE(),203,103);

INSERT INTO Billing65733 VALUES (401,201,5000,CURDATE());
INSERT INTO Billing65733 VALUES (402,202,6000,CURDATE());
INSERT INTO Billing65733 VALUES (403,203,7000,CURDATE());

CREATE VIEW Patient_Bill_View65733 AS
SELECT p.patient_name, b.amount
FROM Patient65733 p
JOIN Billing65733 b
ON p.patient_id = b.patient_id;

SELECT p.patient_name, d.doctor_name, a.app_date
FROM Patient65733 p
JOIN Appointment65733 a
ON p.patient_id = a.patient_id
JOIN Doctor65733 d
ON a.doctor_id = d.doctor_id;

SELECT doctor_name, salary
FROM Doctor65733
WHERE salary >
(SELECT AVG(salary)
FROM Doctor65733);

SELECT AVG(salary)
FROM Doctor65733;

SELECT COUNT(*)
FROM Patient65733;

SELECT * FROM Patient65733;