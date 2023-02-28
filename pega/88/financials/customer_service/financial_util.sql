/* Get Next Work */
SELECT
    wb0."PXOBJCLASS"              AS "pxObjClass",
    wb0."PXURGENCYASSIGN"         AS "pxUrgencyAssign",
    wb0."PXASSIGNEDOPERATORID"    AS "pxAssignedOperatorID",
    wb0."PXREFOBJECTCLASS"        AS "pxRefObjectClass",
    wb0."PXFLOWINSKEY"            AS "pxFlowInsKey",
    wb0."PZINSKEY"                AS "pxInsHandle"
FROM
    pega_data_owner.pc_assign_workbasket wb0
WHERE
        wb0."PXOBJCLASS" = 'Assign-WorkBasket'
    AND ( ( ( wb0."PXWORKGROUP" = 'WPCAgentWG' ) ) )
    AND wb0.pxrequiredskillscount <= 3
    AND wb0.pxrequiredskillscount = (
        SELECT
            COUNT(a_skills.pxskillname) match_skill
        FROM
                 pega_data_owner.pr_index_assignmentskills a_skills
            JOIN pega_data_owner.pr_index_operatorskills o_skills ON a_skills.pxskillname = o_skills.pxskillname
                                                                     AND a_skills.pxskillrating <= o_skills.pxskillrating
        WHERE
                o_skills.pyuseridentifier = '990000000263120231'
            AND a_skills.pxinsindexedkey = wb0.pzinskey
    )
    AND wb0.pyerrorassignment IS NULL
ORDER BY
    wb0."PXURGENCYASSIGN" DESC

/* Poperties having pzExternalName quualifier */
SELECT
    pega_data_owner.pr_read_from_stream('', '', pzpvstream)
FROM
    pega_data_owner.pc_work;

SELECT
    *
FROM
    dba_registry;

--select get_java_property('java.version') from dual;

SELECT
    dbms_java.get_jdk_version jdk_version
FROM
    dual;

SELECT
    *
FROM
    pega_rules_owner.pr4_rule_property;

SELECT DISTINCT
    pyruleset
FROM
    pega_rules_owner.pr4_rule_property
WHERE
    pyruleset NOT LIKE 'Pega%'
ORDER BY
    pyruleset;

SELECT
    *
FROM
    pega_rules_owner.pr4_rule_property
WHERE
    pyruleset IN ( 'appruleset' );

SELECT
    count(*)
FROM
    pega_rules_owner.pr4_rule_property
WHERE
    pyruleset IN ( 'appruleset' );

SELECT
    COUNT(*)
FROM
    pega_rules_owner.pr4_rule_property;


 