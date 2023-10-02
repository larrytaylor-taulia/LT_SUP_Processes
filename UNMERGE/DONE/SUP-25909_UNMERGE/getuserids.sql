SELECT 
    u.id
FROM
    user u
WHERE
    u.company_id = 'f0cba770d09346628f1507d122ca9e2f'
        AND u.email IN ('alice@klelectricinc.com',
        'cash.post@fedex.com', 
        'jnewton@fleeteam.com', 
        'deactivated61127_dherrmann@fleeteam.com', 
        'deactivated72034_jwilleke@fleeteam.com');

        --user email result id: 8a87b4fe879a93930187d75537793e2f

2421e27eb25c4ecd8f79925579ea0486
2c9180f552a444b80152a75ab8eb0059
8a6e11ec483886e001498190599d7051
8a87b4fe879a93930187d75537793e2f
91b348f3f77846fca4e354d26903707c