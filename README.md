# Microsoft SQL Server on Docker

Image is created using _mcr.microsoft.com/mssql/server:2019-CU6-ubuntu-16.04_ as a database, were the following databases are restored:

- AdventureWorks2017.bak

The user _AdventureUser_ is created and associated with each of these databases as db_owner

> The key assigned to the **SA** user must comply with the [security policies](https://docs.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver15) set by SQL SERVER.

> Copy the `.bak` to be restored to `/backups` and include the restore SQL command in the `RestoreDb.sql` file. Include in this file any additional user creation and permissions that you require.

## Technical requirements

- Docker

## Build sql-server image

To build the image run:

`docker build. -t sql-server`

With the following command you can view the list of images created

`docker images`

## Run the container

The following command will create the container called **sql-server-container** using the **sql-server** image.

`docker run -d -p 1433:1433 --name sql-server-container sql-server`

> The password assigned to the user **SA** is _Sa.@2020Password_

> The port through which the service is exposed is 1433.

## Connection

To connect from the host to the container use the following parameters.

- Server: localhost, 1433
- Authentication type: SQL Authentication
- Users: sa, AdventureUser
- Password: Sa.@2020Password,  Adventure.@2020

## Observations

- This image has been configured to allocate 2GB of RAM. To change this parameter, locate the following line `/opt/mssql/bin/mssql-conf set memory.memorylimitmb 2048` in the `Restore.sh` file and assign the desired value and then build the image.

- Once the backups are restored, they are deleted from the image. If you want to convert them remove the `rm -rf /work/*.Bak` line found in the `Restore.sh` file.
