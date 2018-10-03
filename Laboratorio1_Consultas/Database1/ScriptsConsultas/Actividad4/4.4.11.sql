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
DECLARE @gerente AS INT
SET @gerente = 103
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = 
@gerente ORDER BY last_name

set @gerente = 201
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = 
@gerente ORDER BY salary

set @gerente = 124 
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = 
@gerente ORDER BY employee_id