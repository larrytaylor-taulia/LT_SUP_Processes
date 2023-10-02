-- Invoice Report -- get supplier_relation_id(s)
select
 DATE_FORMAT(i.invoice_date, "%m/%d/%Y") AS InvoiceDate, 
 i.number as Invoice, 
 i.po_number as PONumber,
 i.gross_amount as GrossAmount,
 i.net_amount as NetAmount,
 cc.name as Company,
 DATE_FORMAT(i.due_date, "%m/%d/%Y") AS DueDate,
 i.currency as Currency,
 (case    
     when i.status = 32 then 'Approved'
     when i.status = 32768 then 'Cleared'
     when i.status = 2048 then 'Draft' 
     when i.status = 2 then 'In_process'
     when i.status = 512 then 'Incomplete'
     when i.status = 4 then 'Paid'
     when i.status = 1024 then 'Partially_Paid'
     when i.status = 131072 then 'Pendings_'
     when i.status = 65536 then 'Pending_Review'
     when i.status = 8 then 'Rejected'
     when i.status = 64 then 'Submitting...'
     when i.status = 128 then 'Submitting...'
     when i.status = 4096 then 'Submitting...'
     when i.status = 2097152 then 'Submitting...'
     when i.status = 1048576 then 'Submitting...'
     when i.status = 16 then 'Submitting...'
     when i.status = 262144 then 'Validation_Failed'
     when i.status = 524288 then 'Validation_Pending'
     when i.status = 8192 then 'Void'
     when i.status = 16384 then 'Void'
     else 
      i.status = NULL
 end) as Status
from
  invoice i, company_code cc
where
  i.supplier_relation_id in ('81da759d0c4241a18d6ad889ae1f6c93','ecce5cc0d71b46ae83ac994b8fdcf268','2ef22227c4064e8d8e8746b375b6a0a5')
and
  i.invoice_date between '2022-01-01' and '2023-04-19'
and 
 i.company_code_id = cc.id
order by 
invoice_date ASC;