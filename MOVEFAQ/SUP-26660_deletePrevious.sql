start transaction;

DELETE from customer_specific_content 
WHERE buyer_id = '5fd232303dc849d6b8a2a2fb9c688b06' 
AND id in ('134', '138');

commit;