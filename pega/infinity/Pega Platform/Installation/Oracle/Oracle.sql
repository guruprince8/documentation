
/* https://stackoverflow.com/questions/33330968/error-ora-65096-invalid-common-user-or-role-name-in-oracle-database */
alter session set "_ORACLE_SCRIPT"=true; 

/* Set up access */
CREATE USER RULES_23 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS ;
CREATE USER DATA_23 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;
CREATE USER CUSTOMER_23 IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;

/* Grant inherit privileges */
GRANT INHERIT ANY PRIVILEGES TO RULES_23;
GRANT INHERIT ANY PRIVILEGES TO DATA_23;
GRANT INHERIT ANY PRIVILEGES TO CUSTOMER_23;

/* SQL Output
User RULES_23 created.
User DATA_23 created.
User CUSTOMER_23 created.
Grant succeeded.
Grant succeeded.
Grant succeeded.
*/
