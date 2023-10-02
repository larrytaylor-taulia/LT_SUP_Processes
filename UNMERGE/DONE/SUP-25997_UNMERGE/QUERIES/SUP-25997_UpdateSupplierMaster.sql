start transaction;

UPDATE supplier_master 
SET 
    company_id = '9211eabea45b4044a2b8497f07fa0c28',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('d89bcc960fa64af7a2f18e51f34ac9c4');
    commit;
