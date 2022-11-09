
/*How many students do have an advisor in the electrical engineering faculty*/
SELECT INSTRUCTOR.DEPT_NAME, COUNT(STUDENT."ID") AS number_of_students  

FROM STUDENT INNER JOIN ADVISOR ON STUDENT."ID"=ADVISOR."s_ID" INNER JOIN INSTRUCTOR 

ON INSTRUCTOR."ID" = ADVISOR."i_ID"  

WHERE INSTRUCTOR.DEPT_NAME='ELECTRICAL ENGINEERING' GROUP BY INSTRUCTOR.DEPT_NAME; 
