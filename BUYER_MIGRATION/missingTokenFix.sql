drop table if exists tmp_user_enroll;
START TRANSACTION;
  
create temporary table tmp_user_enroll as
select u.id as user, min(se.id) as enrollment
from user u join user_supplier_enrollments ue on ue.user_id = u.id
join supplier_enrollment se on ue.supplier_enrollment_id = se.id
join supplier_relation sr on sr.enrollment_id = se.id
join company_code cc on cc.id = sr.company_code_id
join company b on b.id = cc.buyer_id
left outer join enrollment_token et on u.id = et.user_id
where et.id is null and se.state = 'invited' and se.enrollment_token_id is null
group by u.id;
  
insert into enrollment_token
select replace(replace(uuid(),'-',''),'-',''),0,1,now(),now(),substring(MD5(RAND()), -10),0,tmp_user_enroll.user, null
from tmp_user_enroll;
  
update supplier_enrollment se
join tmp_user_enroll tue on se.id = tue.enrollment
set se.enrollment_token_id =(select id from enrollment_token where user_id =tue.user) , date_approved = date_sub(now(),interval 24 hour), state = 'approved';
 
COMMIT;