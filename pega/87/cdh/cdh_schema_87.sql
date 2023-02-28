/* cdh_88 */
-- SCHEMA: cdh_88_customer

-- DROP SCHEMA IF EXISTS cdh_88_customer ;

CREATE SCHEMA IF NOT EXISTS cdh_88_customer
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA cdh_88_customer TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_customer
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_customer
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_customer
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_customer
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;


-- SCHEMA: cdh_88_data

-- DROP SCHEMA IF EXISTS cdh_88_data ;

CREATE SCHEMA IF NOT EXISTS cdh_88_data
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA cdh_88_data TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_data
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_data
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_data
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_data
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- SCHEMA: cdh_88_rules

-- DROP SCHEMA IF EXISTS cdh_88_rules ;

CREATE SCHEMA IF NOT EXISTS cdh_88_rules
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA cdh_88_rules TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_rules
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_rules
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_rules
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cdh_88_rules
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- jar location /Users/c302318/Desktop/peony/softwares/tomcat/lib/postgresql-42.2.24.jar

/* Installation Sequence */
-- https://docs.pega.com/bundle/customer-decision-hub-88/page/customer-decision-hub/hub/get-started.html
-- sh /Users/c302318/Desktop/peony/softwares/pega/88/tomcat/bin
-- administrator@pega.com / December@2022

-- EXCEPTIONS
 -- Caused by: com.pega.fnx.stream.spi.StreamServiceException: Stream SPI error
 -- Problem executing SQL to update database schema : cdh_88_customer.MKT_COMMUNICATION_HISTORY
CREATE VIEW cdh_88_customer.MKT_COMMUNICATION_HISTORY AS SELECT ifr.pxinteractionid,
    ifr.pysubjectid AS pycaseid,
    ifr.pyexternalid,
    isr.pybehaviour,
    isr.pyresponse,
    isr.pyoutcome,
    irc.pycategory,
    irc.pyreason,
    vs.pycustomersegment AS pxsegment,
    vs.pycustomersubsegment,
    voo.pyorganization,
    voo.pydivision,
    voo.pyunit,
    voo.pyoperator,
    vp.pyissue,
    vp.pygroup,
    vp.pyname,
    vc.pychannel,
    vc.pydirection,
    vc.pytreatment,
    ifr.pxoutcometime AS pystamp,
    ifr.revenue,
    ifr.pyfulfilled,
    ifr.pymaxbudget AS pybudget,
    ifr.pytargetbudget,
    ifr.pyweight,
    ifr.pxrank,
    ifr.pypropensity,
        CASE isr.pyoutcome
            WHEN 'Impression'::text THEN '1'::text
            ELSE '0'::text
        END AS pyopened,
    vs.pysubjecttype,
    irc.workid
   FROM ((((((cdh_88_data.pr_data_ih_fact ifr
     LEFT JOIN cdh_88_data.pr_data_ih_dim_context irc ON ((ifr.pzcontextid = irc.pzid)))
     LEFT JOIN cdh_88_data.PR_DATA_IH_DIM_CUSTOMER vs ON ((ifr.pzcustomerid = vs.pzid)))
     LEFT JOIN cdh_88_data.pr_data_ih_dim_operator voo ON ((ifr.pzoperatorid = voo.pzid)))
     LEFT JOIN cdh_88_data.PR_DATA_IH_DIM_ACTION vp ON ((ifr.pzactionid = vp.pzid)))
     LEFT JOIN cdh_88_data.pr_data_ih_dim_channel vc ON ((ifr.pzchannelid = vc.pzid)))
     LEFT JOIN cdh_88_data.PR_DATA_IH_DIM_OUTCOME isr ON ((ifr.pzoutcomeid = isr.pzid)));