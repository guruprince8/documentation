/* Create Spring Schema  */
-- SCHEMA: spring

-- DROP SCHEMA IF EXISTS spring ;

CREATE SCHEMA IF NOT EXISTS spring
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA spring TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA spring
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA spring
GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA spring
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA spring
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;


/* spring.tutorials */
-- Table: spring.tutorials

-- DROP TABLE IF EXISTS spring.tutorials;

CREATE TABLE IF NOT EXISTS spring.tutorials
(
    id bigint NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    published boolean,
    title character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT tutorials_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS spring.tutorials
    OWNER to postgres;

GRANT ALL ON TABLE spring.tutorials TO postgres WITH GRANT OPTION;


/* spring.cryptography_algorithms */
-- Table: spring.cryptography_algorithms

-- DROP TABLE IF EXISTS spring.cryptography_algorithms;

CREATE TABLE IF NOT EXISTS spring.cryptography_algorithms
(
    alg_key character varying COLLATE pg_catalog."default" NOT NULL,
    salt character varying COLLATE pg_catalog."default",
    salt_length integer,
    CONSTRAINT cryptography_algorithms_pkey PRIMARY KEY (alg_key)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS spring.cryptography_algorithms
    OWNER to postgres;

GRANT ALL ON TABLE spring.cryptography_algorithms TO postgres WITH GRANT OPTION;
