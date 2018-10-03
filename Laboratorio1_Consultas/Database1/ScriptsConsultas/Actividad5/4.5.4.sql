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


SELECT UPPER(last_name)"Apellido",(LOWER(first_name))"Longitud"
FROM employees
WHERE last_name LIKE 'A%'
OR last_name LIKE 'J%'
OR last_name LIKE 'M%' ORDER BY last_name ASC