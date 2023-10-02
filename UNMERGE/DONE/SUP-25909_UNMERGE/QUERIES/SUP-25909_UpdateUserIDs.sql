start transaction;

UPDATE user 
SET 
    company_id = 'a338c02d64084e86adc29fceeaa20684',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN (
        '2421e27eb25c4ecd8f79925579ea0486',
        '2c9180f552a444b80152a75ab8eb0059',
        '8a6e11ec483886e001498190599d7051',
        '8a87b4fe879a93930187d75537793e2f',
        '91b348f3f77846fca4e354d26903707c');

commit;
