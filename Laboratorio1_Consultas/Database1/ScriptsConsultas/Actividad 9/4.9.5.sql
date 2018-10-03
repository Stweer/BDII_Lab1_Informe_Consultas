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

DECLARE @location_id INT;
   SET @location_id=1700;

   SELECT emp.last_name,
          emp.department_id,
		  dep.location_id
		  FROM employees emp
	JOIN departments dep
	  ON dep.department_id = emp.department_id
	   WHERE dep.location_id=@location_id;
