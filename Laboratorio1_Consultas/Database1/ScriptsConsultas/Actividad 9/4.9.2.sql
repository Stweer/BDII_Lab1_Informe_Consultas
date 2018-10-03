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

-- Se pone los "n empleados " como id de empleados

DECLARE @prom  DECIMAL(9,2) ;
   -- Se sentencia una subconsulta llamando al promedio de salario de la tabla empleados
	   SET @prom =(SELECT AVG(salary) FROM employees)

    -- Consultar para listar todos los empleados con salario mayor al promedio

	SELECT  emp.employee_id,
	        emp.last_name,
			emp.salary
	FROM employees emp
	 WHERE emp.salary > @prom