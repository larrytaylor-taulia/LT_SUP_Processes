start transaction ;
update early_payment_request
set version=version+1 , last_updated = now(), status = 1024 
where id = '8a87bb95895c8d1e01896da9db231521';
commit; 
select count(id) 
from early_payment_request 
where status = 1024 
and id = '8a87bb95895c8d1e01896da9db231521' ;



