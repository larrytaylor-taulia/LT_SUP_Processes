start transaction;
UPDATE supplier_relation 
SET 
    last_updated = NOW(),
    version = version + 1,
    enrollment_request_issue_id = NULL
WHERE
    enrollment_request_issue_id IN (
		'8a86910187520bf201875b4063800bd7',
        '8a86910187520bf201875b4e35090bd8',
        '8a869e8a81f86388018215b57a751e06',
        '8a86a11983f0d2710184189f986407dd',
        '8a86a36187e2340d018809827cc90b5b'
		);
commit;