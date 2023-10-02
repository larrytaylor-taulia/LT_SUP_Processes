
select number, invoice_date, purchase_order_number, due_date, gross_amount, net_amount, status, payment_reference
from invoice 
where solr_query = '+supplier_relation_id:(b784df9900d6414a8e7d65c691c75422) 
+invoice_date:[2022-08-02T00:00:00.000Z TO 2022-10-02T00:00:00.000Z]'
LIMIT 10000

Starting asyncronous file generation with [AsyncDocumentDownloadData -> searchParams:[[number:, companyCodeId:, supplierDetailsId:, 
poNumber:, currency:, deliveryNote:, grossAmountLower:, grossAmountUpper:, invoiceDateLower_day:1, invoiceDateLower_month:1, 
invoiceDateLower_year:2022, invoiceDateUpper_day:1, invoiceDateUpper_month:5, invoiceDateUpper_year:2022, dueDateLower_day:, dueDateLower_month:, 
dueDateLower_year:, dueDateUpper_day:, dueDateUpper_month:, dueDateUpper_year:, invoiceIndicator:ALL, invoiceStatus:, max:2147483647, offset:0, order:desc,
 sort:invoiceDate, countDownloadAll:10060, countDownloadPage:10, invoiceDownloadLimit:20000, invoiceSearchType:DSE, total:10, downloadAll:1, 
 downloadType:xls, _:1686678024719, invoiceDateLower:date.struct, invoiceDateUpper:date.struct, dueDateLower:date.struct, 
 dueDateUpper:date.struct, controller:supplierAreaInvoice, action:triggerAsyncDownload]], userId:[8a018ded75dc5b7d01761eeda9fc3715], 
 buyerId: [b784df9900d6414a8e7d65c691c75422], fileType: [xls], domainName: [com.taulia.www.data.bo.Invoice, documentSearchCommand:
  [downloadAll:true, max:2147483647, offset:0, sort:invoiceDate, order:desc, deliveryNote:, leaveSearchFormOpen:false, number:, poNumber:, 
  grossAmountLower:null, grossAmountUpper:null, invoiceDateLower:1640995200000, invoiceDateUpper:1651363200000, companyCodeId:, supplierDetailsId:,
   invoiceStatus:]]] for headers [[history:[[name:asyncDocumentDownloadWorkflowGateway, type:gateway, timestamp:1686678054370],
    [name:asyncDocumentDownloadSerializationChannel, type:channel, timestamp:1686678054370], 
    [name:asyncDocumentDownloadTransformer, type:object-to-json-transformer, timestamp:1686678054370], 
    [name:asyncDocumentDownloadQueueOutChannel, type:channel, timestamp:1686678054370], 
    [name:asyncDocumentDownloadChain, type:chain, timestamp:1686678054378]], id:017706b9-1cbc-7041-8de3-fc43e1c0579f,
     json__TypeId__:com.taulia.www.workflow.asyncDocumentDownload.AsyncDocumentDownloadData, contentType:application/json, timestamp:1686678054378]]