-- Product (PegaProjMgmt-Work-Product)

SELECT *
FROM DATA_88.PPM_PRODUCT
WHERE PYID = 'PRD-1004';

-- Releases (PegaProjMgmt-Work-Product-Version)

SELECT *
FROM DATA_88.PPM_PRODUCT_VERSION;

-- Goals

SELECT *
FROM DATA_88.PPM_WORK
WHERE PXOBJCLASS = 'PegaProjMgmt-Work-Goal';
