start transaction;

UPDATE user 
SET 
    company_id = 'fbfcc7ad76044ce2862a2d1381c8580e',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('8a0390d8750497e9017504aa1e7c0277',
           '8a019022791994a401794b0298c03f46',
           '8a87b1687ebba4bb017ed65b7dc132b9',
           '8a028d5477f8d56801781d1d7bac52c9',
           '8a87a2f485c677f70185d0adb95b0f0c',
           '8a879832843a04040184c1d992e048cf');

commit;
