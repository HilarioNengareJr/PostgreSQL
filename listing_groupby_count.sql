SELECT dept_name, COUNT(dept_name) AS number_of_instructors
FROM instructor GROUP BY dept_name ORDER BY number_of_instructors DESC;
