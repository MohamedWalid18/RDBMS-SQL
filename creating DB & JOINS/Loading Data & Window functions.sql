CREATE TABLE employee_salaries (
    employee_id INT PRIMARY KEY,
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DB.txt'
INTO TABLE employee_salaries
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(employee_id,department, salary, hire_date);



SHOW VARIABLES LIKE 'secure_file_priv';
