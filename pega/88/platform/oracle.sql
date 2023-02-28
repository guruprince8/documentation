
/* 
    http://guru-rhel8.local:8080/prweb
    administrator@pega.com/October@2022
*/

/* 
    http://localhost:8080/prweb
    administrator@pega.com/December@2022
    guru@pega.com / Jan@2023
*/

-- basic operational commands
sqlplus / as sysdba
SHUTDWOWN NORMAL, SHUTDWOWN IMMEDIATE, SHUTDWOWN TRANSACTIONAL
zsh /Applications/SQLDeveloper 5.app/Contents/Resources/sqldeveloper/sqldeveloper.sh
/* Common */
alter session set "_ORACLE_SCRIPT"=true; 
DROP USER COMMON_RULES_88 CASCADE;
DROP USER COMMON_DATA_88 CASCADE;
DROP USER COMMON_CUSTOMER_88 CASCADE;

CREATE USER COMMON_RULES_88 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS ;
CREATE USER COMMON_DATA_88 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;
CREATE USER COMMON_CUSTOMER_88 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;

ALTER USER COMMON_RULES_88 quota unlimited on USERS;
ALTER USER COMMON_DATA_88 quota unlimited on USERS;
ALTER USER COMMON_CUSTOMER_88 quota unlimited on USERS;

-- /Users/c302318/Desktop/peony/LSA/pega/87/ojdbc10.jar
-- jdbc:oracle:thin:@//guru-rhel8.local:1539/orcl

-- table space size
SELECT
    substr(df.tablespace_name, 1, 20)                                                           "Tablespace Name",
    substr(df.file_name, 1, 80)                                                                 "File Name",
    round(df.bytes / 1024 / 1024, 0)                                                            "Size (M)",
    decode(e.used_bytes, NULL, 0, round(e.used_bytes / 1024 / 1024, 0))                             "Used (M)",
    decode(f.free_bytes, NULL, 0, round(f.free_bytes / 1024 / 1024, 0))                             "Free (M)",
    decode(e.used_bytes, NULL, 0, round((e.used_bytes / df.bytes) * 100, 0)) "% Used"
FROM
    dba_data_files  df,
    (
        SELECT
            file_id,
            SUM(bytes) used_bytes
        FROM
            dba_extents
        GROUP BY
            file_id
    )               e,
    (
        SELECT
            MAX(bytes) free_bytes,
            file_id
        FROM
            dba_free_space
        GROUP BY
            file_id
    )               f
WHERE
        e.file_id (+) = df.file_id
    AND df.file_id = f.file_id (+)
ORDER BY
    df.tablespace_name,
    df.file_name;

-- https://logic.edchen.org/how-to-resolve-ora-01653-unable-to-extend-table-in-tablespace/
-- https://community.oracle.com/tech/developers/discussion/4093558/list-all-datafiles-of-tablespaces
-- https://docs.oracle.com/cd/E96927_01/TSG/FAQ/How%20do%20I%20%20increase%20the%20size%20of%20the%20Datafile_.html
-- ALTER DATA FILE SIZE
ALTER DATABASE DATAFILE '/u01/app/oracle/oradata/ORCL/users01.dbf' AUTOEXTEND ON MAXSIZE 10G;

ALTER DATABASE DATAFILE '/u01/app/oracle/oradata/ORCL/users01.dbf' RESIZE 100G;

ALTER TABLESPACE tablespacename ADD DATAFILE '/path_to_datafile/datafilename.dbf' SIZE 8G;

ALTER TABLESPACE USERS ADD DATAFILE '/u01/app/oracle/oradata/ORCL/users02.dbf' SIZE 30G;

ALTER DATABASE DATAFILE '/u01/app/oracle/oradata/ORCL/users01.dbf' AUTOEXTEND ON MAXSIZE 3840M;

ALTER DATABASE DATAFILE '/u01/app/oracle/oradata/ORCL/users01.dbf' AUTOEXTEND ON MAXSIZE UNLIMITED;

ALTER DATABASE DATAFILE '/u01/app/oracle/oradata/ORCL/users01.dbf' AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED;

-- Increase the size limit
ALTER DATABASE DATAFILE 'C:\ORACLE\ORADATA\IDMAKER\DMKR_ASLINE.DBF' AUTOEXTEND ON MAXSIZE 4096M;
-- Remove the size limit
ALTER DATABASE DATAFILE 'C:\ORACLE\ORADATA\IDMAKER\DMKR_ASLINE.DBF' AUTOEXTEND ON MAXSIZE UNLIMITED;