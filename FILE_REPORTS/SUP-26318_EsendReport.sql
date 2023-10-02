SELECT
distinct sd.name AS "Supplier Name",
sd.number AS "Supplier Number",
sd.billing_country_code AS "Supplier Country",
e_inv_esend_spend_one_year AS "eSend Invoices Last Year ($ USD)",
e_inv_esend_count_one_year AS "eSend Invoices Last Year (#)",
ROUND(COALESCE(inv_count_one_year, 0)-COALESCE(e_inv_esend_count_one_year, 0))
FROM polaris_supplier_details sd
WHERE (sd.enrolled_date is not null or (sd.enrolled_date is null and sd.name is NOT NULL))
and inv_count_one_year > 0
and e_inv_esend_spend_one_year is not null
limit 10000;