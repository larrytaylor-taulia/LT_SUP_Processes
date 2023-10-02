SELECT 
    u.id
FROM
    user u
WHERE
    u.company_id = '8a0386f672801c730172a340b3b13ce6'
        AND u.email IN ('eswara.gupta@tcs.com',
                        'd.sabarinath@tcs.com',
                        'sachin.khanna@tcs.com',
                        'amat.pmo@tcs.com',
                        'saima.naseem@tcs.com',
                        'venkat.vunnam@tcs.com');

        --user email result id: 
id
8a0390d8750497e9017504aa1e7c0277
8a019022791994a401794b0298c03f46
8a87b1687ebba4bb017ed65b7dc132b9
8a028d5477f8d56801781d1d7bac52c9
8a87a2f485c677f70185d0adb95b0f0c
8a879832843a04040184c1d992e048cf