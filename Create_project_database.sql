USE master;
GO
--IF DB_ID ('MTG_Project_DB') IS NOT NULL
--Drop database [MTG_Project_DB];
GO
-- Get the SQL Server data path
DECLARE @data_path nvarchar(256);
SET @data_path = (SELECT SUBSTRING(physical_name, 1, CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1)
                  FROM master.sys.master_files
                  WHERE database_id = 1 AND file_id = 1);

Print @data_path
EXECUTE ('CREATE DATABASE [MTG_Project_DB]
ON
PRIMARY  
    (NAME = [MTG_Project_DB],
    FILENAME = '''+ @data_path + 'MTG_Project_DB.mdf'',
    SIZE = 6MB,
    MAXSIZE = 30MB,
    FILEGROWTH = 12%)
LOG ON 
   (NAME = [MTG_Project_Log],
    FILENAME = '''+ @data_path + 'MTG_Project_Log.ldf'',
    SIZE = 3MB,
    MAXSIZE = 22MB,
    FILEGROWTH = 17%)'
);
Go