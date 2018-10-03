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
   -- Se declaran las variables de departamento y apellido para la consulta
   DECLARE @departamento_id INT;
   DECLARE @employee_id INT;
   -- Se da  el apellido del empleado que se consulto 
   SET @employee_id = 102;
   -- obteniendo id de	departamento por empleado 
   SET @departamento_id = (SELECT emp.department_id FROM employees emp
                            WHERE  emp.employee_id= @employee_id);
    
	-- Llamando a todos los empleados excluyendo o con excepción del empleado el cual ha sido
    -- proporcionado su apellido

	SELECT  emp.employee_id ,
	        emp.last_name,
			emp.hire_date,
			emp.department_id
	FROM employees emp 
	 WHERE emp.department_id = @departamento_id AND emp.employee_id!= @employee_id
