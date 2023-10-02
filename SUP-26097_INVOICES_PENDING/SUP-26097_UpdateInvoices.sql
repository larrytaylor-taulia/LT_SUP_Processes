start transaction;


 UPDATE invoice
SET
    status = '512',
    last_updated = NOW(),
    version = version + 1
WHERE
    id in ('caf88ec6f68f4046a99c53e796cb0b65',
'e1ff434a42c3483d8c2f857d0e5a739e',
'015daf1f5679438396e68548181d4342',
'cda7be40c7c745d1a0b9abd965b624d7',
'1a37a416674346568a54fdd2397aa984',
'13d97a917d7340d3b824c7cf80f79988',
'292074885906418c9d38fe278aa5c79c',
'61276402777e4cfab020ae4cf1e9d4e2',
'6f9730f6819c4ac1b694c07b32105fc4',
'85343f7a52d14d689adf4f18398182e3',
'99e766b1670441ea8d08dbdf093a0e50',
'0ba38ba09704450aa752fbe0609590a6',
'0e68a80c91734424b5cd2dda19a4bd29',
'1094f9990b164ceda086bc5a8c7f03f9',
'139fee188937401196bd3c6c014d5d59',
'2d000540f41e491ea81ea2c51448482c',
'3270e3e0969e4e4b80ad35825cec8bf2',
'353cc720a98545d9be97237beff62c5c',
'35d0489034604e86b66fa8446eb2f3c1',
'3eb44e9e39994855afc0d0f16d8479c9',
'4035a5539faf471bb6ec61f109c106bc',
'4538179875f34d3fb82999f0709c2c5e',
'49d521682422467fb9834a09ccfe7cfc',
'4cb61f0d18324a37900084e3299b9d2c',
'57497d18a1b24b4193723aa758c11cd7',
'66b621d6c9084aeca7483ac9e1dcb635',
'864d15306a8e46eabfe55c4d9a4c78e2',
'91b7128302de44a2bb31577af0ea9e00',
'969cf10a00fd4aeeb7668b15b5f8a21d',
'9adac9b39a4c488bbbc10d12d50c3778',
'a957d03ea60e4931b7b370f3434445b2',
'ab4ebd8c69684c3098a1f5e672f7bbf2',
'c4b17341c04740f9a65d53fe53cd93dc',
'c6d9e96ae34f49ab995517716f03a281',
'c8738a7d4614495491af96e1fb3ba1d8',
'c8be679bc176496494b91b17dc5a8d69',
'eb01df3e6d0249d3bb95edff03d8a3fe',
'f8ef57dbb89e4424a98d321aa313ce79',
'ff7d32b15aff487a8dc96ea8229e23b8',
'5cec52c91aa44a0f8834ffa416534980',
'11df8d2e14634b22ac24677299d1f787',
'550edd9de4854be59544e20bae487372',
'5a90b490d61b46c49e59dba3c44250c1',
'd4e9ab0312ac4f8a8f12ab6629b0b98c',
'79474bb05d6e4dbbbc81d48f3ac3dff3',
'7a3729ccd17445ffa717e7cd798383cf',
'd2b8cc6c75e34772994260d97571b273',
'e410f5d01e344502ade940a7119ccf16',
'217e4d63f2e0421587f53d4ec0a44a45',
'3bf23ca1f2814698b5f939902becc074',
'62abf36a21f648bc8c9b14dad9fc7ed9',
'6d60cb2ad06c470db4a3fdf7379a6f12',
'c3fb5a8b129641d19190915e06be9617',
'a97bbde9ffc94509a00f020e81d94f9a',
'005bfbf2ebc34a5fa66ce2bd1f44c4e0',
'69a35f0494194bc4ae29e946b012a352',
'1ddcc313ec72487f8e3952155c72c21a',
'dec8b4eaf06f421583d1aff4186d2d67',
'e849d39ab472466f9bec69c4a2d9af74',
'321d7a8f56584b13b247a2896a199675',
'35afc33576e142f091ae55b107c9c4f8',
'4bb9a81b1efe4e8e978a8a1891e36878',
'7b118c377bbd4512bcb533032762b5eb',
'b3acfadcafcf40c0a04b95f58255c341',
'8ac107441c314b48804a18302fa47a50',
'171ace19de9840b38a0bfe6fe90abe86',
'24da075efbf84e00ada83b666aac6a0c',
'd2ae76840f264a94a602cdb49a732a4d');
commit;
