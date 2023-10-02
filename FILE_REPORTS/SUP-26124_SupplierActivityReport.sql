SELECT
  DISTINCT u.login,
  DATE_FORMAT(u.last_login, "%m-%d-%Y  %h:%m:%s") AS "Last_Login",
  DATE_FORMAT(li.timestamp, "%m-%d-%Y  %h:%m:%s") AS "Timestamp",
  sd.number AS "Vendor Number",
  c.name AS "Buyer Name",
  sd.name AS "Supplier Name",
  count(u.login) as "Logins",
  CASE
    li.log_filter_group
    WHEN 'cashPlannerAccess' THEN 'Cash Planner Access'
    WHEN 'invoiceAccess' THEN 'Invoice Access'
    WHEN 'login' THEN 'Login'
    WHEN 'masterDataAccess' THEN 'Master Data Access'
    WHEN 'paymentAccess' THEN 'Payment Access'
    WHEN 'poAccess' THEN 'PO Access'
    ELSE li.log_filter_group
  END AS "Supplier Activity",
  SUM(li.aggregated_count) AS "Total Count"
FROM
  aggregated_default_log_item li
  INNER JOIN supplier_details sd ON sd.id = li.supplier_details_id
  INNER JOIN user u ON u.company_id = li.buyer_id
  INNER JOIN company c ON c.id = li.buyer_id
WHERE
  sd.supplier_company_id = '8ad86b4040505971014064842e81336e'
  AND u.last_login > '2022-11-01'
GROUP BY
  u.login,
  u.last_login,
  sd.number,
  li.log_filter_group
ORDER BY
  u.last_login ASC;