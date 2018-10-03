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

SELECT emp.last_name 'Empleado' , emp.hire_date 'Fecha_contrato',
       adm.last_name 'Administrador', adm.hire_date 'Fecha_contrato_admin'
	   FROM employees AS emp
	   JOIN employees AS adm
	   ON  emp.manager_id = adm.manager_id
	    AND emp.hire_date < adm.hire_date
		  ORDER BY emp.hire_date;
