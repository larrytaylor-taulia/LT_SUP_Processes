start transaction;

UPDATE supplier_master 
SET 
    company_id = 'fbfcc7ad76044ce2862a2d1381c8580e',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('8a01f39d74a818c60174e00b981f7d4c',
           '8a028a4f74a818be0174dfc6646073af',
           '8a87a5bb7b12ef54017b16e7d2862fb4');
    commit;
