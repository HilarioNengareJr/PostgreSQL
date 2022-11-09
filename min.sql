/* For each department, find out the lowest salaried instructor. Sort the list */

SELECT instructor.name, instructor.dept_name, instructor.salary FROM instructor

INNER JOIN (SELECT dept_name, min(salary) AS minimum_salary 
			FROM instructor GROUP BY dept_name) AS temporary_ 
			
ON temporary_.dept_name=instructor.dept_name 

AND temporary_.minimum_salary=instructor.salary;
