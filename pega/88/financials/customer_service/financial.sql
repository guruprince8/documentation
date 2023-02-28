-- https://stackoverflow.com/questions/58047749/how-to-create-user-in-oracle-19c-database
-- https://smarttechways.com/2020/03/19/ora-12514-tnslistener-does-not-currently-know-of-service-requested-in-connect-descriptor/

-- Caused by: java.sql.SQLSyntaxErrorException: ORA-01950: no privileges on tablespace 'USERS'

--https://support.esri.com/en/technical-article/000012391
-- DatabaseException caused by prior exception: java.sql.SQLException: ORA-06598: insufficient INHERIT PRIVILEGES privilege

-- RHEL8
/* start DB and lsnrctl */

/* 
su - oracle
sqlplus / as sysdba
start - starts orcl instance
shutdown - shutdown instance
lsnrctl start 
lsnrctl stop 
*/

GRANT INHERIT PRIVILEGES ON USER SYSTEM TO PUBLIC;

-- generic sql's

select * from all_tables;

select * from dba_registry;

select * from dba_users;

select * from global_name;

-- common schema
alter session set "_ORACLE_SCRIPT"=true;

/* Common */

DROP USER COMMON_RULES CASCADE;
DROP USER COMMON_DATA CASCADE;
DROP USER COMMON_CUSTOMER CASCADE;

CREATE USER COMMON_RULES IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS ;
CREATE USER COMMON_DATA IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;
CREATE USER COMMON_CUSTOMER IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;

ALTER USER COMMON_RULES quota unlimited on USERS;
ALTER USER COMMON_DATA quota unlimited on USERS;
ALTER USER COMMON_CUSTOMER quota unlimited on USERS;

/* Financials */

DROP USER FINANCIAL_RULES CASCADE;
DROP USER FINANCIAL_DATA CASCADE;
DROP USER FINANCIAL_CUSTOMER CASCADE;

CREATE USER FINANCIAL_RULES IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS ;
CREATE USER FINANCIAL_DATA IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;
CREATE USER FINANCIAL_CUSTOMER IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;

ALTER USER FINANCIAL_RULES quota unlimited on USERS;
ALTER USER FINANCIAL_DATA quota unlimited on USERS;
ALTER USER FINANCIAL_CUSTOMER quota unlimited on USERS;


-- listening ports
select dbms_xdb_config.gethttpsport () from dual;
select dbms_xdb_config.gethttspsport () from dual;
-- start 5500 
exec dbms_xdb_config.sethttpsport (5500);

-- active sessions
select * from v$session where status = 'ACTIVE' /*and username is not null */;

--  Current heartbeat is taking longer than [30000]ms. Creating a thread dump... oracle connection issue

--ALTER TABLE PEGA_DATA_OWNER.PR_APPLE_NUCLEUS_DATA_PE_323C7 MODIFY ( GIGAFILETOKEN VARCHAR2(256));

-- explain plan
EXPLAIN PLAN FOR SELECT * FROM SYSTEM.TODOITEM;
select * from PLAN_TABLE;
SELECT * FROM table(DBMS_XPLAN.DISPLAY (FORMAT=>'ALL +OUTLINE'))