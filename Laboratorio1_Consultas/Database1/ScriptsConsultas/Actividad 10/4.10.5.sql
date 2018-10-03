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
select t1.last_name ,t1.department_id ,t2.department_name from employees t1 
      full join departments t2 ON t1.department_id = t2.department_id
    union all
   select  t2.last_name ,t2.department_id , t1.department_name from departments	t1
    full join employees t2 ON t1.department_id = t2.department_id  
	order by department_id asc;