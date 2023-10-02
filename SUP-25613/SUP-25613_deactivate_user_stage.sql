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
     id IN ('8a859bcd7d298314017d39f76ecc0ad1');
 
COMMIT;
