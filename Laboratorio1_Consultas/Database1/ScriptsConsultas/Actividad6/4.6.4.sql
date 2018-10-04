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
select last_name as 'Apellidos', 'Comision'='Sin Comision' from dbo.employees where
commission_pct <= 0
UNION
select last_name as 'Apellidos', 'Comision'= Cast((salary * commission_pct) as
varchar(20)) from dbo.employees where commission_pct >0
go