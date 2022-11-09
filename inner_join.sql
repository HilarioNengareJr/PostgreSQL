/*Using INNER JOIN with WHERE clause */
SELECT student.name AS Student, instructor.name AS Instructor, student.dept_name AS faculty
FROM student INNER JOIN advisor ON "ID"="s_ID"
INNER JOIN instructor ON "i_ID"=instructor."ID" 
WHERE student.dept_name='ELECTRICAL ENGINEERING' ORDER BY student.tot_cred DESC;
