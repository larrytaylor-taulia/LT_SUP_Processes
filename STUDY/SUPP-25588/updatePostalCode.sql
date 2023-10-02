START TRANSACTION;

UPDATE company_code_address 
SET 
    po_box_zip_code = NULL,
    version = version + 1,
    last_updated = NOW()
WHERE
    id IN ('2711818', 
    '2712847',
    '2712848',
    '2712849',
    '2712850',
    '2712851',
    '2712852',
    '2712853',
    '2712854',
    '2712855',
    '2712856',
    '2712857',
    '2712858',
    '2731762',
    '2732180')
    
COMMIT;