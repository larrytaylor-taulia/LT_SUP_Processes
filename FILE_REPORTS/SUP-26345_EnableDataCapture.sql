START TRANSACTION;

INSERT INTO invoice_country_compliance_by_buyer (id, country_code, buyer_id, from_country_supported, to_country_supported, to_country_supported_data_capture_from_country, date_created, last_updated, version, compliance_type, mandatory_attachment)
VALUES 
(replace(uuid(),'-',''), 'BH', 'f5963a18588541e4a9a7ff27299e3452', b'1', b'1', b'1', now(), now(), 0, 'DATA_CAPTURE', b'1');

commit;