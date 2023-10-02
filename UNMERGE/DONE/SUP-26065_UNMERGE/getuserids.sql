SELECT 
    u.id
FROM
    user u
WHERE
    u.company_id = '8a028a4f74a818be0174dfc6645f73ae'
        AND u.email IN ('eswara.gupta@tcs.com',
                        'd.sabarinath@tcs.com',
                        'sachin.khanna@tcs.com',
                        'amat.pmo@tcs.com',
                        'saima.naseem@tcs.com',
                        'venkat.vunnam@tcs.com');

        --user email result id: 
