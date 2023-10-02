START TRANSACTION;

UPDATE user 
SET 
    version = version + 1,
    enabled = b'0',
    email = CONCAT('deactivated_', email),
    login = CONCAT('deactivated_', login),
    disabled_by_company_admin = 1,
    last_updated = NOW()
WHERE
    id IN ('8a87a0be7f93bc7a017ff911ba77016d', '8a87a4787cc3007c017cccf1154218f5', '8a87a44a7dcac041017df92f0db852c8', '8a87b3577ebba4df017ef9614c867db1', '8a87a79580905cb00180b254a6ba2ff3', '8a8799a07cb60ee3017cb9355eb409fb', '8a87a5117f6585b7017f79962fc03dde', '8a87a44b8047ed8c01804c78c2a70806', '8a87b3577ebba4df017edae447503e30', '8a879ee97f0395e2017f0a95cd7a117c', '8a87a3997e724af6017eb12023a313aa', '8a87b65a8241178d01826e1808384879', '8a879c228240ec1001828203ecd660ce', '8a87a6478240ebcb01826e113f274a65', '8a87b3577ebba4df017ee4cfaeae5e04', '8a878d3680905ca80180a935926e21c5', '8a87a79580905cb00180a934d3b4214c', '8a879fc980fd064001811b09a5b62987', '8a87981d7d0bc01b017d1566687717ba', '8a879fc980fd064001811b0aa329298a', '8a87ad7c7f658588017f78da3b5338fc', '8a87a44b8047ed8c01806b7620594415', '8a87a7097dcac05e017e20ba2e6b0aea', '8a879eb97f6585a7017f6ed756d717e5', '8a87abdf7c7aa17d017c9010e2992bce', '8a879ff67cc30076017d06fb807318c9', '8a87ad7c7f658588017f88faf829540d', '8a87a3997e724af6017e7e28b6ff1feb', '8a878d8a836147790183836355c36760', '8a8794a27ebba4ef017ef943aede7dbf', '8a87a3997e724af6017e9b4eba025ad9', '8a87b2b37e71f6dd017e9245fe3e4301', '8a01f33b6d25c3fc016d2c438c061003', '8a87a0787a913b04017abfc78520686e', '8a02f0646e464fe7016e4c40e1ed16b8', '8a018f74701b596101701c0e55870498', '8a87a5117f6585b7017f6a8b30dc0d32', '8a87a91e8047edac0180505566350f57', '8a87b7a47e725915017e974821e04dde', '8a87a5117f6585b7017f7364db4129e9', '8a8794a27ebba4ef017ef93e18687db1', '8a879c228240ec1001828203831f60cb', '8a87b49f828905a101829212414c0ba6', '8a87a0be7f93bc7a017ffe0ae02e0e91', '8a879b8e8361476b0183c0f7d13c50f1', '8a87a44280fd062801812035d8cd3349', '8a87a30f843a03f1018453a870cb25b7', '8a87a3b27dc0020a017dc42c5eb80a43', '8a87a3b27dc0020a017dc42acc840a3f', '8a87a66b8361477001837760675b3f82', '8a87a7727e2bb1bf017e57e4d8c35523', '8a87a91e8047edac0180705bb50750e5');
     
COMMIT;