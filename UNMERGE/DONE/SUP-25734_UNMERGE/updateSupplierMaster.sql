start transaction;

UPDATE supplier_master 
SET 
    company_id = '3ee6faecdcf4439983be1e8063071647',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN ('0052b27078604a78a20c2924cc7a7102',
'094ce4fe89bf4b1e86f7659a5efe3c3c',
'0cbe08c814ca448c985d1f72fef27890',
'0e9b7e27dc594f66920f826428194b9f',
'0ea1e13b1a304fc48970baac84a73c74',
'10be100806064ae092f708a911617861',
'176ac96a3ee748889392efbcff63b874',
'1d781b72b99541118f6bff0beea03032',
'356fae02a2b44d919a0982522113e47c',
'3a2b409a57ac4592bbffa4f5a88e042d',
'3b2949dcb68d4a958451c509c1d52b8a',
'44809204ad1c4e9ab4484efb8a662061',
'4558252d4d42402c955705f8ea7da01b',
'496659dbb63a418883c8c0c16d28eb49',
'4f9e27524e2d48478725963025f8cdc8',
'54f8f265c42641d694c075d4fcd275fa',
'5cf85fc5058c4e48a7e518dedd6a2a08',
'5d236779f59846dbbe1052fcd958b188',
'6831b4fb14f740358485115b620eef9c',
'6bc0814b98524315858f64354f990920',
'7057bd002c1f4be09dc15d73f6ebfc5d',
'718049f03ade43fa8a332736d8585242',
'7437bba6bc3e40869e64df0587ff8163',
'848a0980b09b46269f50ab9f7650723e',
'8a0093b5728024c20172bcfe1c355a6b',
'8a009c4372801d820172bcfe1e115ba7',
'8a009cb77720dfad017763c42c4c49fb',
'8a01f38b72c7fdad0172c947c4f10945',
'8a01f38b72c7fdad0172c947caf20951',
'8a01f38b72c7fdad0172c9509a7e0b90',
'8a02864572c7fc510172c9509adc0b50',
'8a02878874a819180174e4efe2440e36',
'8a028b9372c7fcbb0172c947cb1d09c7',
'8a0386f672801c730172a340b3b93ce7',
'8a038728764887a4017685b95ed94a72',
'8a03900872c7fd6a0172c947c52609ac',
'8a43f75b353160270135874a92c448f1',
'8a43f75b358e1ad50135ab4e8e287141',
'8a43f75b35b2325d0135ee7f1b2772fa',
'8a879cf77aca3fbf017addfd41db4e08',
'8a87a5d37bea2108017c28f4bfdb45d1',
'8af6871b3780e0f00137cdb84e224a0b',
'8af68d6b3f25a273013f2fef94b04a36',
'8af84bcf3b8c7c58013b965c56e7633b',
'8afc325f3689ccd001369f59f7477325',
'8be89c94ab9842bb845eeca926df0553',
'94c4729d36ff478bbed44f790f3e0d4b',
'9745e4d2bcc3487bbe122dee954113f8',
'9d265758feef46f68fd33b6cb4d9d354',
'a201c8151a7c4575ae2be9231e710dad',
'a7b65b9b4da84eb085cb8e0735620c45',
'aed712d046e94fd39f291d651f0b5f29',
'b19152ac04954e2d9edc4bbef0623b33',
'b546b0493606464fb5ecf3cb881f50ed',
'b879a03c3e3b4610b74d200e339513d1',
'bea78fd671784bd19076080c6bd64991',
'bf46af045ecf4192bf37109c1ac49f13',
'c7af291f15ba4e8eb06ffb8f7853d40c',
'c7b1408ee8e34930a7bc648373adc7c9',
'c9e1390ae7494e33950ddc7c7edcfad6',
'd691f416fd1e4e16ad81dcb52ac3a785',
'd8769d9b5a5c488d9235feb20f3f6228',
'dc64a37ce4134649994a090f2d9b455b',
'e70cbf805aff42568d279332125d4c29',
'fb8b51e023d546388e57820b721fb1e0')

commit;