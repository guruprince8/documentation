-- http://guru-rhel8.local:8080/prweb/ - rhel8
-- https://guru-rhel8.local:8443/prweb/ - rhel8
-- administrator@pega.com / Feb@022023
-- ECRMAdmin / Mar@032023
-- ECRMAuthor / December@2022
-- art@venere.org / November@2022
-- DMReleaseAdmin / November@2022
-- DMAppAdmin / November@2022
-- jbutt@gmail.com / Feb@022023

-- http://localhost:8080/prweb - mac
-- https://localhost:8443/prweb/ - mac
-- guru@pega.com / Jan@2023
-- administrator@pega.com/ November@2022
-- ECRMAuthor / Feb@2023
-- ECRMAdmin / November@2022
-- art@venere.org / November@2022
-- DMReleaseAdmin / November@2022
-- DMAppAdmin / November@2022



-- http://192.168.1.5:8080/ - DEV - cisco
-- https://192.168.1.5:8443/prweb - cisco
 -- administrator@pega.com / install
 -- author@Jenkins.com / October@2022
 -- DMAppAdmin / November@2022

-- tomcat start script
 -- sh /opt/tomcat/bin/startup.sh
 -- tomcat stop script
   -- sh /opt/tomcat/bin/shutdown.sh
 -- tomcat catalina watch script
  -- tail -f /opt/tomcat/logs/catalina.out

alter session set "_ORACLE_SCRIPT"=true; 
DROP USER COMMON_RULES CASCADE;
DROP USER COMMON_DATA CASCADE;
DROP USER COMMON_CUSTOMER CASCADE;

CREATE USER COMMON_RULES IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS ;
CREATE USER COMMON_DATA IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;
CREATE USER COMMON_CUSTOMER IDENTIFIED BY oracle DEFAULT TABLESPACE USERS quota unlimited on USERS;

ALTER USER COMMON_RULES quota unlimited on USERS;
ALTER USER COMMON_DATA quota unlimited on USERS;
ALTER USER COMMON_CUSTOMER quota unlimited on USERS;

-- SYSTEM-USER-DASHBOARD CSADMIN!CSHOME!ACCESSGROUP
-- SYSTEM-USER-DASHBOARD DEFAULT!CSHOME!DEFAULT

-- gmail accounts
approveviaemail@gmail.com
