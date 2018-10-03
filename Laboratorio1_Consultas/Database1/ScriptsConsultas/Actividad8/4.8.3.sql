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

SELECT emp.last_name ,dep.department_id,department_name,j.job_title FROM employees AS emp
   
   LEFT JOIN jobs AS j
     ON emp.job_id = j.job_id
	  
	  JOIN departments AS dep
	     ON dep.department_id=emp.department_id

		 JOIN locations AS loc 
		   ON dep.location_id = loc.location_id
		     
			 WHERE loc.city='Toronto'