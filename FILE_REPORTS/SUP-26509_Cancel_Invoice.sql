start transaction;
update early_payment_request
set version=version+1, last_updated=now(), status=1024
where id = '8a87b41487e38eaa0187f011b2741242';
commit;