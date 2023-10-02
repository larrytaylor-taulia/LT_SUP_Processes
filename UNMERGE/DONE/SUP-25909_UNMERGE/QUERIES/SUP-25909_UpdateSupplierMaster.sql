start transaction;

UPDATE supplier_master 
SET 
    company_id = 'a338c02d64084e86adc29fceeaa20684',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('0940484e31af4df99a76530e4b6722d9',
'13aee68620bb400e99a68a93e1b66662',
'305127a73b4544268589c5977d8e6f30',
'57812b57dc2642099d5e152c0abcc5fc',
'6be4d5f421f14818aa7903439319e49d',
'7a3d948df2f34feb8588c1c7edb34dd7',
'7b3abf76d74a4ebda1169cbb1b74140c',
'85cbcbe5f162477180976b418a7f64f1',
'8a00903e6a02fa68016a32f7c7460987',
'8a009d9b737772df0173a1cdac513f32',
'8a019327738d65830173a1f9702f3265',
'8a0290cc73776f870173a1d025023f34',
'8a0386af737777680173a1d029a13f3a',
'8a0386af737777680173a1d21f53412f',
'8a039293737773f90173a1cfd7633e8c',
'8a09ac134249aa8201429a23ac5c76d9',
'8a878af27a916446017aa1183e955e0e',
'8a87a6ef7f4c5f25017f638efa5c3459',
'8e2c7b3e4caf4f49b90e4c5d7bff0f74',
'98a9893528064263acdf31652fbc609e',
'b11b1f5b65444a17b9bec8399a28a3ce',
'c6f952850476420b8f587fc83eb26b40',
'ca388223999e4d47b43b40a52bd72783',
'e1053f8ecfb04b4fa7234d928c0c71bc',
'e3c3c3761c2c4029a6cdc3a015b07c0f',
'ecd1e6874aee4632abab04bc8426f00f',
'ed6260a22169477a9492645a4cac208f',
'fce9c5e2f9e5454ea941e2cab8e4a9aa'
    );
commit;
