start transaction;
UPDATE ar_invoice 
  SET status = 'VOIDED'
  WHERE id = '8a87a04b84ee5bca0184f7b9d0780001';
commit;