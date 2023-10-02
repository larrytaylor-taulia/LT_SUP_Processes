START TRANSACTION;

set names utf8;

update vendor_setup_custom_content set version = 0, date_created = NOW(), last_updated = null where vendor_setup_section_id in (select id from vendor_setup_custom_section where buyer_id = '68b265c7666e43f6bd904522ed1237b1');
update vendor_setup_custom_content_option set version = 0, date_created = NOW(), last_updated = null where vendor_setup_custom_content_id in (select id from vendor_setup_custom_content where vendor_setup_section_id in (select id from vendor_setup_custom_section where buyer_id = '68b265c7666e43f6bd904522ed1237b1'));
update portal_setting set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update portal_field_setting set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update buyer_special_charge set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update buyer_tax_exempt_reason set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update buyer_file_upload_configuration set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update style set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_company_id = '68b265c7666e43f6bd904522ed1237b1';
update vendor_setup_custom_section set version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update platform_hook_metadata set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update certification_type set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update supplier_contact_department set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update supplier_contact_role set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update holiday_calendar set id = replace(uuid(),'-',''), version = 0, date_created = NOW(), last_updated = null where buyer_id = '68b265c7666e43f6bd904522ed1237b1';
update company set version = version+1, last_updated = now(), name = 'MOEN??', domain = 'prd-moenchina.com', email_from = 'donotreply@supplier.moen.com' where id = '68b265c7666e43f6bd904522ed1237b1';
INSERT INTO portal_setting (id, version, name, value, buyer_id, last_updated, date_created, name_key) SELECT * FROM (SELECT replace(uuid(),'-',''), 0, '361', 1, '68b265c7666e43f6bd904522ed1237b1', NOW() last_updated, NOW() date_created, 'ENABLE_ENROLL_DATA_UPDATE_TIMEOUT') as tmp WHERE NOT EXISTS ( SELECT * FROM portal_setting WHERE buyer_id='68b265c7666e43f6bd904522ed1237b1' AND name='361') LIMIT 1;
UPDATE portal_setting set value = 1, last_updated=NOW(), name_key='ENABLE_ENROLL_DATA_UPDATE_TIMEOUT' WHERE buyer_id='68b265c7666e43f6bd904522ed1237b1' AND name='361' AND value=0;

COMMIT;
