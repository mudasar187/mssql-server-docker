USE master
GO

PRINT 'Restoring AdventureWorks2017'
 -------------------------------------------------
--> Restoring AdventureWorks2017
-------------------------------------------------

RESTORE DATABASE AdventureWorks2017
FROM DISK =  N'/work/AdventureWorks2017.bak'
WITH FILE = 1,
     MOVE N'AdventureWorks2017'
     TO  N'/var/opt/mssql/data/AdventureWorks2017.mdf',
     MOVE N'AdventureWorks2017_log'
     TO  N'/var/opt/mssql/data/AdventureWorks2017_log.ldf',
     NOUNLOAD,
     STATS = 5;

GO

-------------------------------------------------
--> Adding user AdventureUser
-------------------------------------------------

USE master;
GO
CREATE LOGIN AdventureUser
WITH PASSWORD = N'Adventure.@2020',
     DEFAULT_DATABASE = AdventureWorks2017
GO


-------------------------------------------------
--> Adding permissions to AdventureUser
-------------------------------------------------

USE AdventureWorks2017
GO
CREATE USER AdventureUser FOR LOGIN AdventureUser
GO
USE AdventureWorks2017
GO
ALTER ROLE db_owner ADD MEMBER AdventureUser
GO