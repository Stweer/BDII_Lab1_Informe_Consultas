/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
 -- Conseguir id de empleado con apellido King

  SELECT employee_id,
         last_name  FROM employees
		  WHERE last_name ='King'

  -- Conseguir id de departments que coindican en manager_id  con employee_id

  SELECT dep.department_id
         FROM departments AS dep 
	JOIN (SELECT employee_id, 
	             last_name 
				 FROM employees
			  WHERE last_name='King') AS manking
		ON dep.manager_id= manking.employee_id


	SELECT emp.last_name,
		   emp.salary
	    FROM employees AS emp
     JOIN (SELECT dep.department_id
	              FROM departments AS dep
				  JOIN (SELECT employee_id ,
				               last_name
				          FROM employees
						    WHERE last_name='King')AS manking

					ON  dep.manager_id= manking.employee_id ) AS depking
					 
			ON emp.department_id = depking.department_id;