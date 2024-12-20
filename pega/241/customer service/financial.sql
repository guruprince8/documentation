
/* Install home brew using the following command */
-- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

-- execut the following eval commands

-- (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/xion/.bash_profile
--eval "$(/usr/local/bin/brew shellenv)"

/*** install open JDK 17 */
-- brew install openjdk@17

sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
echo 'export PATH="/usr/local/opt/openjdk@17/bin:$PATH"' >> /Users/xion/.bash_profile

/* Install postgres 14 */
-- brew install postgresql@14
-- /opt/homebrew/var/postgresql@14
-- cd /opt/homebrew/var/log 
/* If issues with postgres restart */
-- rm -rf /opt/homebrew/var/postgresql@14/postmaster.pid
-- rm /opt/homebrew/var/postgresql/postmaster.pid
-- rm /usr/local/var/postgres/postmaster.pid
-- brew services restart postgresql
-- https://wiki.postgresql.org/wiki/Homebrew

psql postgres

ALTER USER postgres WITH PASSWORD 'postgres';
CREATE USER postgres WITH PASSWORD 'postgres';
grant all privileges on database postgres to postgres;
flush privileges;

/* Install PgAdmin 4 from https://www.pgadmin.org/download/pgadmin-4-macos/ */
-- https://www.pgadmin.org/download/pgadmin-4-macos/

/* Create DB schemas as per below schema creation scripts */

-- SCHEMA: data_241

-- DROP SCHEMA IF EXISTS data_241 ;

CREATE SCHEMA IF NOT EXISTS data_241
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA data_241 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_241
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_241
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_241
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_241
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;


-- SCHEMA: rules_241

-- DROP SCHEMA IF EXISTS rules_241 ;

CREATE SCHEMA IF NOT EXISTS rules_241
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA rules_241 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_241
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_241
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_241
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_241
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;


-- SCHEMA: customer_241

-- DROP SCHEMA IF EXISTS customer_241 ;

CREATE SCHEMA IF NOT EXISTS customer_241
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA customer_241 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_241
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_241
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_241
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_241
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"

/* Download media zips using Pega support portal and needs be added to partner account administrators */

-- https://docs.pega.com/bundle/customer-service-financial/page/customer-service-financial/install-update-adoption/intro-install-constellation-csfs.html
-- install platform using install.sh

/* Tomcat download */
-- https://tomcat.apache.org/download-90.cgi

-- Install Pega using FFS 117811_PFFS_24.1.0
 -- \Rules\PegaFFS_Int.jar
 -- \Rules\PegaFFS.jar
 -- \Rules\PegaFFS_Sample.jar
 -- \Rules\PegaFFS_Schema.jar
 -- \Rules\PegaFFS_DataInstances.jar 
 -- Sample Data
 -- \SampleData\PegaFFS_SampleSchema.jar
 -- \SampleData\PegaFFS_SampleDataInstances.jar
 -- \SampleData\PegaFFS_SnapSchema.jar
 -- \SampleData\PegaFFS_SnapDataInstances.jar
 -- PDFS
 -- \ResourceKit\PDFS\Rules\PegaPDFS.jar
 -- \ResourceKit\PDFS\rules\PegaPDFS_Implementation.jar
 -- \ResourceKit\PDFS\SampleData\PegaPDFSSampleProducts.jar
 -- \ResourceKit\PDFS\SampleData\PegaPDFSSampleObjects.jar

-- Install Common Data Model using 117758_PCDM_24.1.0
 -- \Rules\Common.jar
 -- \ResourceKit\CommonReferenceData.jar

-- Install Common Data Model using 117762_PCDMFS_24.1.0
 -- \Rules\Common-FinancialServices.jar
 -- \ResourceKit\CommonFSReferenceData.jar

-- Install Customer Service using 117790_PCRM_24.1.0
 -- \Rules\CustomerService-Cases.jar
 -- \Rules\PegaCRM.jar

-- Install Customer Service Financials Using 117793_PCRMFS_24.1.0
 --\Rules\CustomerService-Cases-FS.jar
 --\Rules\PegaCRMFS.jar
