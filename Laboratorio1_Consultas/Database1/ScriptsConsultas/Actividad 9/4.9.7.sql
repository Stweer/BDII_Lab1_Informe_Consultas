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

SELECT * FROM departments WHERE department_name='executive';

-- Listar empleados con nombre de puesto

 SELECT emp.department_id,
        emp.last_name,
		jobs.job_title
		FROM  employees AS emp
   JOIN jobs 
   ON emp.job_id=jobs.job_id

   -- Empleados con departamento ejecutivo "executive"

   SELECT emp_n_j.department_id,
          emp_n_j.last_name,
		  emp.n_j.job_title
		  FROM departments
	JOIN(SELECT  emp.department_id ,
	             emp.last_name,
				 jobs.job_title
				 FROM employees AS emp
				  JOIN jobs
				  ON emp.job_id=jobs.job_id ) AS emp_n_j
		 ON emp_n_j.department_id = departments.department_id
     WHERE department_name='executive';
