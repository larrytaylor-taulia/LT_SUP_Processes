start transaction;

UPDATE user 
SET 
    company_id = 'c1dec84839cb4c6b903ff478eef4da7f',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('8a878dcd860e852e0186508c3390048f');

commit;
