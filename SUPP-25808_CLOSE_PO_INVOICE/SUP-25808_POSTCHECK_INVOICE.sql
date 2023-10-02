-- Result should be: 1,410,394	
start transaction;

select count(*) from invoice
WHERE company_code_id in ( 
'e11173b95ec544b7baa3aaed98559063',
'2c9180bd5ebefe58015ef6c272580069',
'2c9180bd5ebefe58015ef6c281cb0092',
'2c9181d261fd0a9a0161fea49f760002',
'2c9180bd5ebefe58015ef6c283990097',
'2c9180bd5ebefe58015ef6c27b000081',
'2c9180bd5ebefe58015ef6c27d3c0086',
'2c9181d261fd0a9a0161fea49f360001',
'2c9180bd5ebefe58015ef6c27a54007f',
'2c9180bd5ebefe58015ef6c28c7f00b0',
'2c9180bd5ebefe58015ef6c282d20095',
'6587ea9d3cef4abc8eca9729c9b38092',
'2c9180bd5ebefe58015ef6c2832a0096',
'2c9180bd5ebefe58015ef6c26c7f0059',
'2c9180bd5ebefe58015ef6c28b1f00ac',
'2c9180bd5ebefe58015ef6c26f750061',
'2c9180bd5ebefe58015ef6c27aa10080',
'2c9180bd5ebefe58015ef6c284020098',
'2c9180bd5ebefe58015ef6c28d3700b2',
'2c9180bd5ebefe58015ef6c26fd80062',
'2c9180bd5ebefe58015ef6c26d3d005b',
'2c9180bd5ebefe58015ef6c277a10078',
'2c9180bd5ebefe58015ef6c281740091',
'2c9180bd5ebefe58015ef6c282780094',
'2c9180bd5ebefe58015ef6c284bd009a',
'2c9180bd5ebefe58015ef6c27855007a',
'2c9180bd5ebefe58015ef6c26a570054',
'2c9180bd5ebefe58015ef6c26e05005d',
'2c9180bd5ebefe58015ef6c27cc30085',
'2c9180bd5ebefe58015ef6c2851c009b',
'2c9180bd5ebefe58015ef6c27fa5008c',
'2c9180bd5ebefe58015ef6c274d80070',
'2c9180bd5ebefe58015ef6c27476006f',
'2c9180bd5ebefe58015ef6c27907007c',
'2c9180bd5ebefe58015ef6c27ec4008a',
'2c9180bd5ebefe58015ef6c26cdc005a',
'2c9180bd5ebefe58015ef6c27ffa008d',
'2c9180bd5ebefe58015ef6c2774e0077',
'2c9180bd5ebefe58015ef6c270e60065',
'2c9180bd5ebefe58015ef6c2868c009f',
'2c9180bd5ebefe58015ef6c26c1c0058',
'ef2550e4af3b4877b85fbdfc097cb3e5',
'2c9180bd5ebefe58015ef6c282230093',
'2c9180bd5ebefe58015ef6c26e61005e',
'2c9180bd5ebefe58015ef6c2719c0067',
'2c9180bd5ebefe58015ef6c28c2a00af',
'2c9180bd5ebefe58015ef6c27d990087',
'2c9180bd5ebefe58015ef6c280ad008f',
'2c9180bd5ebefe58015ef6c2879100a2',
'2c9180bd5ebefe58015ef6c27f3a008b',
'2c9180bd5ebefe58015ef6c289b500a8',
'2c9181d261fd0a9a0161fea49fb70003',
'2c9180bd5ebefe58015ef6c2884300a4',
'2c9180bd5ebefe58015ef6c2845f0099',
'2c9180bd5ebefe58015ef6c270900064',
'2c9180bd5ebefe58015ef6c279cc007e',
'2c9180bd5ebefe58015ef6c277fc0079',
'2c9180bd5ebefe58015ef6c28633009e',
'2c9180bd5ebefe58015ef6c2895900a7',
'2c9180bd5ebefe58015ef6c285d8009d',
'2c9180bd5ebefe58015ef6c28a0d00a9',
'2c9180bd5ebefe58015ef6c26bc70057',
'2c9180bd5ebefe58015ef6c28abd00ab',
'2c9180bd5ebefe58015ef6c288a000a5',
'2c9180bd5ebefe58015ef6c275e00073',
'2c9180bd5ebefe58015ef6c27366006c',
'2c9180bd5ebefe58015ef6c2873600a1',
'2c9180bd5ebefe58015ef6c27413006e',
'2c9180bd5ebefe58015ef6c272b4006a',
'2c9180bd5ebefe58015ef6c276360074',
'2c9180bd5ebefe58015ef6c26eb8005f',
'2c9180bd5ebefe58015ef6c278ab007b',
'2c9180bd5ebefe58015ef6c273bf006d',
'2c9180bd5ebefe58015ef6c288fd00a6',
'2c9180bd5ebefe58015ef6c26f0b0060',
'2c9180bd5ebefe58015ef6c28059008e',
'2c9180bd5ebefe58015ef6c28a6500aa',
'2c9180bd5ebefe58015ef6c26b6c0056',
'2c9180bd5ebefe58015ef6c26b0d0055',
'2c9180bd5ebefe58015ef6c27b750082',
'2c9180bd5ebefe58015ef6c28b7600ad',
'2c9180bd5ebefe58015ef6c286e300a0',
'2c9180bd5ebefe58015ef6c27967007d',
'2c9180bd5ebefe58015ef6c2810f0090',
'2c9180bd5ebefe58015ef6c27e690089',
'2c9180bd5ebefe58015ef6c28bd200ae',
'2c9180bd5ebefe58015ef6c27c5b0084',
'2c9180bd5ebefe58015ef6c27bf90083',
'2c9180bd5ebefe58015ef6c271410066',
'2c9180bd5ebefe58015ef6c2758d0072',
'2c9180bd5ebefe58015ef6c276f00076',
'2c9180bd5ebefe58015ef6c271fb0068',
'2c9180bd5ebefe58015ef6c28573009c',
'2c9180bd5ebefe58015ef6c2730b006b',
'2c9180bd5ebefe58015ef6c270370063',
'2c9180bd5ebefe58015ef6c275380071',
'2c9180bd5ebefe58015ef6c276900075',
'2c9180bd5ebefe58015ef6c27e100088',
'2c9180bd5ebefe58015ef6c287e700a3',
'958f0b5b25e148c3ad38e419046bc895',
'2c9180bd5ebefe58015ef6c28cda00b1',
'2c9180bd5ebefe58015ef6c26d9e005c'
);
commit;