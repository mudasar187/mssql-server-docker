FROM mcr.microsoft.com/mssql/server:2019-CU6-ubuntu-16.04

USER root

RUN mkdir /work

COPY /backups/AdventureWorks2017.bak /work

COPY /src/RestoreDb.sql /work

COPY /src/Restore.sh /work

WORKDIR /work

RUN chmod 755 Restore.sh

RUN ./Restore.sh RestoreDb.sql