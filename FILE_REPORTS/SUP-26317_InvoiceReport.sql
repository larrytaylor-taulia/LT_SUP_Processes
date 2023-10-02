SELECT
cc.number AS "Buyer Business Unit",
cc.name AS "Buyer Business Unit Name",
sd.number AS "Vendor Number",
sd.name AS "Vendor Name",
i.number AS "Invoice Number",
i.po_number AS "PO Number",
CASE
    WHEN i.invoice_indicator = 1 THEN 'Invoice'
    WHEN i.invoice_indicator = 0 THEN 'Credit'
END AS "Document Type",
i.currency AS "Invoice Currency",
CASE
    WHEN i.invoice_indicator = 1 THEN ROUND(i.gross_amount,2)
    WHEN i.invoice_indicator = 0 THEN ROUND((i.gross_amount * -1),2)
END AS "Gross Amount",
i.net_amount AS "Net Amount,",
DATE_FORMAT(i.invoice_date, "%m/%d/%y") AS "Document Date",
DATE_FORMAT(i.posting_date, "%m/%d/%y") AS "Posting Date",
DATE_FORMAT(i.due_date, "%m/%d/%y") AS "Invoice Due Date",
i.status AS "Status Code",
CASE
    WHEN i.status = 2 THEN 'IN_PROCESS'
    WHEN i.status = 4 THEN 'PAID'
    WHEN i.status = 8 THEN 'REJECTED'
    WHEN i.status = 16 THEN 'SUBMITTED'
    WHEN i.status = 32 THEN 'READY_FOR_PAYMENT'
    WHEN i.status = 64 THEN 'IN_SUBMISSION_ON_PORTAL'
    WHEN i.status = 128 THEN 'IN_SUBMISSION_TO_ERP'
    WHEN i.status = 512 THEN 'INCOMPLETE'
    WHEN i.status = 1024 THEN 'PARTIALLY_PAID'
    WHEN i.status = 2048 THEN 'DRAFT'
    WHEN i.status = 4096 THEN 'ON_HOLD'
    WHEN i.status = 8192 THEN 'VOIDED'
    WHEN i.status = 16384 THEN 'VOIDING'
    WHEN i.status = 32768 THEN 'CLEARED'
    WHEN i.status = 65536 THEN 'PENDING_REVIEW'
    WHEN i.status = 131072 THEN 'PENDING_CANCELLATION'
    WHEN i.status = 262144 THEN 'TAX_CLEARANCE_VALIDATION_FAILED'
    WHEN i.status = 524288 THEN 'TAX_CLEARANCE_VALIDATION_PENDING'
    WHEN i.status = 1048576 THEN 'SUBMISSION_POST_PROCESS'
    WHEN i.status = 2097152 THEN 'SUBMISSION_FAILED'
END AS "Status Description",
i.erp_status_explanation as "Sub-Status Description",
pr.payment_date AS "Payment Date (Buyer Payment to Supplier)",
pr.number AS "Buyer Payment Reference",
fpr.payment_date AS "Funder Payment Date",
fpr.number AS "Funder Payment Reference",
CASE
    WHEN fpr.id IS NOT NULL THEN 'EP-PAID'
    ELSE ''
END as "Taulia Overall Early Payment Status",
i.payment_block as "Payment Block"
FROM
invoice i
LEFT JOIN supplier_relation sr on sr.id = i.supplier_relation_id
LEFT JOIN supplier_details sd on sd.id = sr.supplier_details_id
LEFT JOIN supplier_master sm on sm.id = sd.supplier_master_id
LEFT JOIN company_code cc on cc.id = i.company_code_id
LEFT JOIN funder_payment_record_relation fprr on fprr.invoice_id = i.id
LEFT JOIN funder_payment_record fpr on fpr.id = fprr.funder_payment_record_id
LEFT JOIN invoice_payment_record_link iprl on iprl.invoice_id = i.id
LEFT JOIN payment_record pr on pr.id = iprl.payment_record_id
WHERE sm.company_id IN ('8af84bcf3c593957013c5e27519e546b')
AND (i.invoice_date between '2022-06-15' and '2022-06-16')
ORDER BY i.invoice_date ASC;
