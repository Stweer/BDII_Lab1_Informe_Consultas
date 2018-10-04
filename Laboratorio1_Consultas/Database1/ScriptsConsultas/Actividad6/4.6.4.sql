select last_name as 'Apellidos', 'Comision'='Sin Comision' from dbo.employees where
commission_pct <= 0
UNION
select last_name as 'Apellidos', 'Comision'= Cast((salary * commission_pct) as
varchar(20)) from dbo.employees where commission_pct >0
go