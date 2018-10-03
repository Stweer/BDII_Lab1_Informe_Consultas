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
CREATE FUNCTION LPAD
(
@string VARCHAR(MAX),
@length INT,
@pad CHAR
)
RETURNS VARCHAR(MAX)
AS 
BEGIN
RETURN REPLICATE(@pad,@length - LEN(@string)) + @string;
end
GO

SELECT dbo.LPAD(salary,15,'$') value FROM employees