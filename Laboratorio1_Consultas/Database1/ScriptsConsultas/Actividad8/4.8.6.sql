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

SELECT emp.department_id 'DEPARTMENT', emp.last_name 'Empleado',
       e.last_name 'Colega'
	   FROM employees  AS emp
      JOIN employees AS e
	   ON (e.department_id=emp.department_id) AND emp.last_name !=e.last_name;