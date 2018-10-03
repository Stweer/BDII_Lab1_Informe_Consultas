/*
Script de implementación para HR

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HR"
:setvar DefaultFilePrefix "HR"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creando [dbo].[countries]...';


GO
CREATE TABLE [dbo].[countries] (
    [country_id]   CHAR (2)     NOT NULL,
    [country_name] VARCHAR (40) NULL,
    [region_id]    INT          NULL,
    CONSTRAINT [country_c_id_pk] PRIMARY KEY CLUSTERED ([country_id] ASC)
);


GO
PRINT N'Creando [dbo].[departments]...';


GO
CREATE TABLE [dbo].[departments] (
    [department_id]   INT          NOT NULL,
    [department_name] VARCHAR (30) NULL,
    [manager_id]      INT          NULL,
    [location_id]     INT          NULL,
    CONSTRAINT [dept_id_pk] PRIMARY KEY CLUSTERED ([department_id] ASC)
);


GO
PRINT N'Creando [dbo].[employees]...';


GO
CREATE TABLE [dbo].[employees] (
    [employee_id]    INT            NOT NULL,
    [first_name]     VARCHAR (20)   NULL,
    [last_name]      VARCHAR (25)   NULL,
    [email]          VARCHAR (25)   NULL,
    [phone_number]   VARCHAR (20)   NULL,
    [hire_date]      DATE           NULL,
    [job_id]         VARCHAR (10)   NULL,
    [salary]         DECIMAL (8, 2) NULL,
    [commission_pct] DECIMAL (2, 2) NULL,
    [manager_id]     INT            NULL,
    [department_id]  INT            NULL,
    CONSTRAINT [emp_emp_id_pk] PRIMARY KEY CLUSTERED ([employee_id] ASC),
    CONSTRAINT [emp_email_uk] UNIQUE NONCLUSTERED ([email] ASC)
);


GO
PRINT N'Creando [dbo].[job_history]...';


GO
CREATE TABLE [dbo].[job_history] (
    [employee_id]   INT          NOT NULL,
    [start_date]    DATE         NOT NULL,
    [end_date]      DATE         NULL,
    [job_id]        VARCHAR (10) NULL,
    [department_id] INT          NULL,
    CONSTRAINT [jhist_emp_id_st_date_pk] PRIMARY KEY CLUSTERED ([employee_id] ASC, [start_date] ASC)
);


GO
PRINT N'Creando [dbo].[jobs]...';


GO
CREATE TABLE [dbo].[jobs] (
    [job_id]     VARCHAR (10) NOT NULL,
    [job_title]  VARCHAR (35) NULL,
    [min_salary] INT          NULL,
    [max_salary] INT          NULL,
    CONSTRAINT [job_id_pk] PRIMARY KEY CLUSTERED ([job_id] ASC)
);


GO
PRINT N'Creando [dbo].[locations]...';


GO
CREATE TABLE [dbo].[locations] (
    [location_id]    INT          NOT NULL,
    [street_address] VARCHAR (40) NULL,
    [postal_code]    VARCHAR (12) NULL,
    [city]           VARCHAR (30) NULL,
    [state_province] VARCHAR (25) NULL,
    [country_id]     CHAR (2)     NULL,
    CONSTRAINT [loc_id_pk] PRIMARY KEY CLUSTERED ([location_id] ASC)
);


GO
PRINT N'Creando [dbo].[regions]...';


GO
CREATE TABLE [dbo].[regions] (
    [region_id]   INT          NOT NULL,
    [region_name] VARCHAR (25) NULL,
    CONSTRAINT [reg_id_pk] PRIMARY KEY CLUSTERED ([region_id] ASC)
);


GO
PRINT N'Creando [dbo].[countr_reg_fk]...';


GO
ALTER TABLE [dbo].[countries] WITH NOCHECK
    ADD CONSTRAINT [countr_reg_fk] FOREIGN KEY ([region_id]) REFERENCES [dbo].[regions] ([region_id]);


GO
PRINT N'Creando [dbo].[dept_loc_fk]...';


GO
ALTER TABLE [dbo].[departments] WITH NOCHECK
    ADD CONSTRAINT [dept_loc_fk] FOREIGN KEY ([location_id]) REFERENCES [dbo].[locations] ([location_id]);


GO
PRINT N'Creando [dbo].[emp_dept_fk]...';


GO
ALTER TABLE [dbo].[employees] WITH NOCHECK
    ADD CONSTRAINT [emp_dept_fk] FOREIGN KEY ([department_id]) REFERENCES [dbo].[departments] ([department_id]);


GO
PRINT N'Creando [dbo].[emp_job_fk]...';


GO
ALTER TABLE [dbo].[employees] WITH NOCHECK
    ADD CONSTRAINT [emp_job_fk] FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobs] ([job_id]);


GO
PRINT N'Creando [dbo].[emp_manager_fk]...';


GO
ALTER TABLE [dbo].[employees] WITH NOCHECK
    ADD CONSTRAINT [emp_manager_fk] FOREIGN KEY ([manager_id]) REFERENCES [dbo].[employees] ([employee_id]);


GO
PRINT N'Creando [dbo].[jhist_dept_fk]...';


GO
ALTER TABLE [dbo].[job_history] WITH NOCHECK
    ADD CONSTRAINT [jhist_dept_fk] FOREIGN KEY ([department_id]) REFERENCES [dbo].[departments] ([department_id]);


GO
PRINT N'Creando [dbo].[jhist_emp_fk]...';


GO
ALTER TABLE [dbo].[job_history] WITH NOCHECK
    ADD CONSTRAINT [jhist_emp_fk] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees] ([employee_id]);


GO
PRINT N'Creando [dbo].[jhist_job_fk]...';


GO
ALTER TABLE [dbo].[job_history] WITH NOCHECK
    ADD CONSTRAINT [jhist_job_fk] FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobs] ([job_id]);


GO
PRINT N'Creando [dbo].[loc_c_id_fk]...';


GO
ALTER TABLE [dbo].[locations] WITH NOCHECK
    ADD CONSTRAINT [loc_c_id_fk] FOREIGN KEY ([country_id]) REFERENCES [dbo].[countries] ([country_id]);


GO
PRINT N'Creando [dbo].[emp_salary_min]...';


GO
ALTER TABLE [dbo].[employees] WITH NOCHECK
    ADD CONSTRAINT [emp_salary_min] CHECK ([salary]>(0));


GO
PRINT N'Creando [dbo].[jhist_date_interval]...';


GO
ALTER TABLE [dbo].[job_history] WITH NOCHECK
    ADD CONSTRAINT [jhist_date_interval] CHECK ([end_date]>[start_date]);


GO
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
/*Es Correcta*/

SELECT last_name,job_id, salary AS Sal FROM employees
GO

GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[countries] WITH CHECK CHECK CONSTRAINT [countr_reg_fk];

ALTER TABLE [dbo].[departments] WITH CHECK CHECK CONSTRAINT [dept_loc_fk];

ALTER TABLE [dbo].[employees] WITH CHECK CHECK CONSTRAINT [emp_dept_fk];

ALTER TABLE [dbo].[employees] WITH CHECK CHECK CONSTRAINT [emp_job_fk];

ALTER TABLE [dbo].[employees] WITH CHECK CHECK CONSTRAINT [emp_manager_fk];

ALTER TABLE [dbo].[job_history] WITH CHECK CHECK CONSTRAINT [jhist_dept_fk];

ALTER TABLE [dbo].[job_history] WITH CHECK CHECK CONSTRAINT [jhist_emp_fk];

ALTER TABLE [dbo].[job_history] WITH CHECK CHECK CONSTRAINT [jhist_job_fk];

ALTER TABLE [dbo].[locations] WITH CHECK CHECK CONSTRAINT [loc_c_id_fk];

ALTER TABLE [dbo].[employees] WITH CHECK CHECK CONSTRAINT [emp_salary_min];

ALTER TABLE [dbo].[job_history] WITH CHECK CHECK CONSTRAINT [jhist_date_interval];


GO
PRINT N'Actualización completada.';


GO
