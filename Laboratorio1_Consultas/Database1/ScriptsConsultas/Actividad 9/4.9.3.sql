/*
							
--------------------------------------------------------------------------------------

3. Realizar un reporte que muestre el N° de Empleado y Apellidos de todos los empleados quienes trabajan
en el departamento de cualquier empleado que su apellido contenga la letra ‘u’	

--------------------------------------------------------------------------------------
*/

SELECT  emp.employee_id,
        emp.last_name,
		emp.department_id
     FROM employees emp  
	 JOIN (SELECT DISTINCT emp.department_id FROM employees emp
	            WHERE emp.last_name LIKE '%u%')  AS dep_id
				    ON  emp.department_id=dep_id.department_id
