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
     id IN ('8a869c967c7a4ffd017c9ff3603f0b23');
 
COMMIT;
