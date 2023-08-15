-- Product (PegaProjMgmt-Work-Product)

SELECT *
FROM DATA_88.PPM_PRODUCT
WHERE PYID = 'PRD-1004';

-- Releases (PegaProjMgmt-Work-Product-Version)

SELECT *
FROM DATA_88.PPM_PRODUCT_VERSION;

-- Goals (PegaProjMgmt-Work-Goal)

SELECT *
FROM DATA_88.PPM_WORK
WHERE PXOBJCLASS = 'PegaProjMgmt-Work-Goal';

-- Epic ( PegaProjMgmt-Work-UserStory-Epic )

SELECT *
FROM DATA_88.PPM_WORK
WHERE PXOBJCLASS = 'PegaProjMgmt-Work-UserStory-Epic';

-- Story ( PegaProjMgmt-Work-UserStory )

SELECT *
FROM DATA_88.PPM_WORK
WHERE PXOBJCLASS = 'PegaProjMgmt-Work-UserStory';

-- Task ( PegaProjMgmt-Work-Task )
SELECT *
FROM DATA_88.PPM_WORK
WHERE PXOBJCLASS = 'PegaProjMgmt-Work-Task';
