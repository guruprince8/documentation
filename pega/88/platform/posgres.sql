/******* SCHEMA CREATION SCRIPTS ********/
-- SCHEMA: customer_88

-- DROP SCHEMA IF EXISTS customer_88 ;

CREATE SCHEMA IF NOT EXISTS customer_88
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA customer_88 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_88
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_88
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_88
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer_88
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- SCHEMA: rules_88

-- DROP SCHEMA IF EXISTS rules_88 ;

CREATE SCHEMA IF NOT EXISTS rules_88
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA rules_88 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_88
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_88
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_88
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA rules_88
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- SCHEMA: data_88

-- DROP SCHEMA IF EXISTS data_88 ;

CREATE SCHEMA IF NOT EXISTS data_88
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA data_88 TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_88
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_88
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_88
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA data_88
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

/******* USEFUL QUERIES ********/
 CREATE VIEW data_88.MKT_COMMUNICATION_HISTORY AS SELECT ifr.pxinteractionid,
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
   FROM ((((((data_88.pr_data_ih_fact ifr
     LEFT JOIN data_88.pr_data_ih_dim_context irc ON ((ifr.pzcontextid = irc.pzid)))
     LEFT JOIN data_88.PR_DATA_IH_DIM_CUSTOMER vs ON ((ifr.pzcustomerid = vs.pzid)))
     LEFT JOIN data_88.pr_data_ih_dim_operator voo ON ((ifr.pzoperatorid = voo.pzid)))
     LEFT JOIN data_88.PR_DATA_IH_DIM_ACTION vp ON ((ifr.pzactionid = vp.pzid)))
     LEFT JOIN data_88.pr_data_ih_dim_channel vc ON ((ifr.pzchannelid = vc.pzid)))
     LEFT JOIN data_88.PR_DATA_IH_DIM_OUTCOME isr ON ((ifr.pzoutcomeid = isr.pzid)))
