start transaction;

UPDATE user 

SET
    company_id = '3ee6faecdcf4439983be1e8063071647',
    last_updated = NOW(),
    version = version + 1

WHERE

    id IN ('8a01f36a7792bf4d017796f10ff90716',
'8a2483bd519781990151eea45bca08c2',
'8a87a604860e8507018647bfb2756bc4',
'8a038daa6fcdcd55016fcf016f170447',
'8a87a3c87cc30071017d0579b9d9149b',
'8a0194aa6fc8e782016fcf016df010e2',
'8a87a4277aca2e9a017aea20ed0d5651',
'8a87b49f828905a10182a7f1f1d128d1',
'8a0293af72d397510172e094571a102c',
'8a01919d77f8d5640178464e1ce124a7',
'e41cf97051344ff2b1affea588ead696',
'88fbe0eeac55457e993c1fd579817810',
'8a038daa6ff7ddf20170052186bf1dce',
'2c9180875bc53b15015bc964b58107a3',
'a5b8e524740641a290ea4ae00a69ce93',
'8a018eae7850bbaf01788441be0f6477',
'8a87a9437c32aada017c385e78c4115c',
'8a8798bf7a913b13017aaa253f283c89',
'8a0086d2682f2e0101685d8e6bdf0f3d',
'8a0086d57768dd710177890110f93d24',
'8a01f2727624814701763e46673b387c',
'8a87a44a7dcac041017de874de9341a7',
'8a87a5c27c32aaa9017c385d605a10bc',
'cd919d37b68e49738b8b2d11f064ad58',
'8a0090fb7624811d01764134427d3b4d',
'8a00879c72853cb90172a33b7bbe49e6',
'8a87a6478240ebcb0182844534566bf5',
'8a028a2d6989cf43016996dd95a12771',
'8a0290a7733972c3017348a092141850',
'8a6e11ec4bdd1329014c7ab0ac981efe',
'8a01f33b6cd3a500016ce1d8e13f25b4',
'30f5ce9abece4aed97692aca61b8d740',
'8a87a5c27c32aaa9017c60e3dcf76df9',
'8a039364735379cb01735d2739a51260',
'2c9180a55ceafaa4015d339af6ff675b',
'8a878bcb7cb60efd017cb7aa4f3203d8',
'8a018e9379616e010179852b9e9e7593',
'c57fe3e844ec49a88e42b2472ff04a8c',
'2c9180e053be5dfd0153ce07bc161719',
'8a018f3c6ad799b6016b042bfe352332',
'2c9180a563f51d4b01644cc31b457d55',
'8a018c4e7850bc81017865aa2fdc299d',
'2c9180c253be60840153f102c403368c',
'8a009d867377687d017377845f9f0023',
'8a018f3c6a93267c016a9eeea57b50ae',
'8a009c8270f33465017102de894e384d',
'cbba93ce27604d2a860c56aa9e1314eb',
'2c9180b252ebab1501532eccbfcf0de5',
'8a028db372d39768017305dfa5775192',
'8a009cf9682f35430168c873f21a1274',
'8a018c4e7850bc810178659b384d297d',
'2c91817a648a54a10164fac876741c44',
'2c9180b95887e4b6015888cfa43801b7',
'8a029217682f31b10168ceed2d4341fc',
'8a009ce26b472c9c016bb38d7691607e',
'8a00943074d9f4af0174e48cd1cd1b46',
'2c918119655d77c501656d5724752764',
'8a018d686fa51e14016fb34d53e627ed',
'8a0087a26c3e53c0016c3f72db4003e2',
'8a878d73857eb5ea0185c50a259570e8',
'8a01f3c671a789720171add1b9eb1b35',
'8a01f3a06b472e94016bb395727e5de6',
'8a018f3c6ad799b6016b0023971d0bdb',
'8a87952d7c7aa15f017c9a0186a44835',
'8a87a4277aca2e9a017ae85bea514f9f',
'8a8794a27ebba4ef017efcd0f0a10387',
'8a028a7466f6765101670e7b032a4bf0',
'8a87b3577ebba4df017efd9e1bfe048b',
'c55505d11ec44650ba57efd728c25ee6',
'e3fe94e701d14de8b0d2fb2b6f442a5c',
'8a879c228240ec100182682438a23cc4',
'8a87a30f843a03f101847c42a04c65c3',
'2c9180cd665eabaf0166ab7ad1130a1e',
'8a01940579c8c3c80179ccbb0ee107fd',
'2c9180e65bc5388b015bcb116175092b',
'8a01940a717e44c701717f7aaec0095f',
'2c9180e053be5dfd0153f10234423642',
'8a87aa1d7dcac032017de874dc3a40db',
'8a6e11ec47a83cd10147f49289d6054f',
'8a879e857c32aab7017c4bd7c16933a4',
'8a87a6478240ebcb018283eb25bb6b77',
'8a0390d8750497e9017508ffbadd1402',
'8a009cf9682f354301685c971bcd0f92',
'8a039364735379cb01735e67ee4d1674',
'8a87a384822c88de01823be1778012b8',
'8a038dba6a02e8d8016a59aa73b65dd1',
'8a00943074b2b3f10174b7aa66ac0b84',
'8a018ded75dc5b7d0175e711996a287f',
'8a03905b6bf607c9016c04a93e102507',
'8a87ac868665d2590186796c8a201ff7',
'8a02927777f8d55e017802a829711357',
'8a03905b6c3e886e016c3f74547d0269',
'8a87b3577ebba4df017efe16f87a08fa',
'0efaf29cf81941afaf7aad135f992812',
'2c9180d552a447e40152d2084c610acf',
'8a01919d77f8d5640177fd85a1820771',
'8a03865977cf90cd0177d0f6030803fc',
'8ad83e77383c007301386d601da06a31',
'2c9180f3655d723c01657b6414e0361c',
'8aa7d6364249b155014271d6612f7f85',
'2c91810c65155a3e0165208ab3f40f7c',
'8a028b87776385c0017763ca8f760116',
'8a028bbe79616dd801798b1326c51f83',
'8a018d376f80c306016f80d6a7300032',
'8a02f06c7624812801762f7b607025cd',
'2c9180f552a444b80152c1bff5e805d3',
'8a02f06c7624812801762e58883b2003',
'8a03936473488101017348a011b3013c',
'2c9180f552a444b80152c1bf13d605cd',
'2c91817761b98fab0161d430110d1eac',
'8a2b94a7408cf6280140e590847a0bfc',
'8a01f3f8725784a301725812e57603d7',
'8a0090fb7624811d01762e5b15201eb6',
'8a018f3c6ad799b6016b45a84df238c3',
'2c9181a257f78a84015806c0fef27869',
'8a0390d8750497e9017508ff092f13ff',
'8afc577b3b444819013b4471452a03a6',
'8a02f06c7624812801762e5a5e132035',
'8a028a2d6989cf430169d91f11770687',
'8a879e857c32aab7017c4c03a8db3476',
'8a87a9437c32aada017c385dd7191158',
'8a0286f675045f1701751e10184b4186',
'dc6e8e3e92604977adff9df98214fb37',
'2c9181f263f523c101648a4a9e495105',
'8a018d376ed16d17016ed2741f0405d6',
'8a0286f675045f1701751e0ea60f4177',
'8a01f3cf6fa51fee016fb30c1c212421',
'8a0193a36c3e49ab016c3f73e6ba0412',
'b018796a20fb43f9a721e32fa6bc530e',
'2c9180e65e76f812015e8695d07c43fe',
'8a0190d76ad7868c016b042c841623c7',
'8a02934a6989cf550169c1f173a91e12',
'8a01f36a7782a6ac01778cea94c21738',
'8a02938970a6c3f60170a6e03d770091',
'8a8798bf7a913b13017aaa26ce993c90',
'2c91801854de69d10154e80e99eb0d2e',
'8a87a7097dcac05e017de874e03e3fa1',
'2c9181ec58f40f1c0158f9ace4320add',
'8a87a6a27cb60ec4017cbd91ee84169e',
'8a0194aa6ff2906f016ffd6610651a2a',
'8a87a7727f93bc68017fe185cdcb4fe7',
'8a8788367bea196d017befb6345d0f8a',
'8a01924d79a509c10179a964ed4a1d79',
'8a01f36a7792bf4d017796f035a5070a',
'8af2530c3e7bc212013e8f0fd240610b',
'8a009c8270f3346501710f8a4a4a75c6',
'8a87ab118047ee0301806a4040a74141',
'8a879ff67cc30076017d041e49190eea',
'8a02938970876f960170a6bdd3f57ff4',
'4e15b3eef3914bd4b654b8ce20f9c4e3',
'8a87a44b8047ed8c01806a4171ce3fd5',
'8a0194aa6fc8e782016fcf016cf910df',
'8a01914f74b2b3ca0174b7bdfe380c48',
'8ac90cea4556cda6014589a73dcf01eb',
'b26daefb63824eeb98a99a74aa908b33',
'8a87a44b8047ed8c01806a40df593fd1',
'2c9180f552a444b80152c1c0a8d105d6',
'8a03878b7850bbc401787f8dd3025566',
'8a01f2727624814701762f79c5c42450',
'8a87993f84ee547b0185777d7b963557',
'8a879a3f7d9ba1b4017dad9602c024a5',
'8a878d8a8361477901838e920cc37f6f',
'8a879e857c32aab7017c385f3f3e10ee',
'8a87a7727e2bb1bf017e71bf936207df',
'8a018e9379616e010179a96442466bd2',
'631a83d753504ac189df5b09d85b8032',
'8a00867e735d49190173768a58f23e44',
'8a00912f76d8c1210176e3fff9301b30',
'2c9180a4583fc2d401585061b3c83bb2',
'8a87a0787a913b04017a9ac978c10dce',
'8a0195d46a02e6fe016a59bf8cf55fb7',
'8a0b806e3f25a8f1013f2ebbeaca1358',
'4441d74324094d91be4743ff60af9a50',
'8a0087a26c2495f9016c2f43b37b1a56',
'8a87a4277aca2e9a017ae3ccff763a92',
'8a87b2c7860e84e3018646b381a66d39',
'8a879fa17e2bb19e017e4daa3f563e20',
'8a0195d46a02e6fe016a2b44fd1c5e8d',
'8a0392c57791e539017796efece6092d',
'017fc59b35004e739dc986fa75dc1dda',
'8a87b1687ebba4bb017efe20df7508e0',
'8a8798bf7a913b13017ac4aacbe67b89',
'ef9295bd3f164bd4977be8cb72320506',
'8a87b4628240ebe70182682119203c02',
'8ad83e773780efdd0137cdbdd07058ff',
'e49034beae9946c6b423dc8fdad043da',
'2c9181d357af67f10157c4a192a81be3',
'8a018e9379616e010179b459ced329aa',
'8a02927777f8d55e0178464bd5f624ce',
'2c918119655d77c50165ab1d0d1c01b5',
'8a179b6b40e53a6c01411372ab2b06ca',
'8a87ae237fffe31e0180479e8af56495')


commit;