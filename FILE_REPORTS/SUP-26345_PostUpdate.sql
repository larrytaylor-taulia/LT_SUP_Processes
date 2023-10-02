START TRANSACTION;

SELECT id,
       country_code,
       buyer_id,
       compliance_type,
       cast(from_country_supported AS unsigned) AS 'from_country_supported',
       cast(to_country_supported AS unsigned) AS 'to_country_supported',
       cast(to_country_supported_data_capture_from_country AS unsigned) AS 'to_country_supported_data_capture_from_country',
       cast(mandatory_attachment AS unsigned) AS mandatory_attachment,
       VERSION,
       date_created,
       last_updated
FROM invoice_country_compliance_by_buyer
WHERE buyer_id = 'f5963a18588541e4a9a7ff27299e3452' and country_code = 'BH'
commit;