START TRANSACTION;

UPDATE user 
SET 
    version = version + 1,
    enabled = b'0',
    email = CONCAT('deactivated_', email),
    login = CONCAT('deactivated_', login),
    disabled_by_company_admin = 1,
    last_updated = NOW()
WHERE
    id IN ('8a8587e581776c5e018181bf23ce00ae', '8a8585fb7eb69bfa017ed3b95aae10ff');
     
COMMIT;