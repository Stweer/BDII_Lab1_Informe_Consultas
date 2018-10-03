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

SELECT emp.employee_id 'ID_Empledao', emp.last_name 'Empledao',
       e.manager_id 'ID_Manager', e.last_name 'Manager' 
	     FROM employees AS emp
     JOIN employees e
	  ON(e.manager_id =emp.manager_id);