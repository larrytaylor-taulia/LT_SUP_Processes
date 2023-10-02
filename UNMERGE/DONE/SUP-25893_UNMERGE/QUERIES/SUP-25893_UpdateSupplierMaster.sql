start transaction;

UPDATE supplier_master 
SET 
    company_id = 'c1dec84839cb4c6b903ff478eef4da7f',
    last_updated = NOW(),
    version = version + 1
WHERE
    id IN (
'17772dcb546c4540ab924cf7189aa2a4',
'1d41976562aa434e88589dc09da01488',
'2dd1f6e684544998b225ef5ae0bcc23a',
'3c896f927b4a4ef0932eb021a23ccb97',
'42cf0fc336a844d68772ec83a7fd409b',
'583fa851695a44418915799281b04ea1',
'5c21a8c2f5e442b1ad4d82c4a24a9828',
'6554fbbd08834586b4248208d6aeed36',
'878ebd27a26c4cecad62badeeaf5d212',
'8a028bdf75dc61a60175e857ba2852cc',
'8a03929b73bfa406017402d14be46f90',
'8a3480e854dea3060154e3e7249f18d2',
'8a3480e854dea3060154e3e726a7191a',
'8a3480e854dea3060154e3e727401931',
'8a3480e854dea3060154e3e727d81948',
'8a3481a053beae630153f3ece63d4c32',
'8a3481a054deabb80154e3e6ec3e462f',
'8a3481a054deabb80154e3e6eca44643',
'8a8798a47cc309eb017cf0592d212505',
'8a87997b82410edd01827dcda7a710bd',
'8a879ff8819c2b4a0181da58643d6370',
'8a87a2247bea241f017c08c88f061753',
'8a87b0e28318fbbb0183493232596c5e',
'8ad86b4040ea66d6014123ad27306a8f',
'8ad86b4040ea66d6014123ad4c736bc6',
'8bfd80c3f6aa424c9cf2b31fc06f8cdb',
'a5dc5c333593437aa08737f8f20bd3e6',
'a65fc16717274666874fbbc7a4f75944',
'af2f30eb7d34430a9a5b332c0e2044f8',
'b364e3478e96473dac62a7eea18bd2ea',
'b788635ce8184462bfbbec9804706550',
'd23e975f46ac4ceaaa87a1ae2eec9349',
'd5e4446e23584397bf0f4422335336b4',
'dec6a6a4f3b84c8fac899e87695b1645'
);
commit;