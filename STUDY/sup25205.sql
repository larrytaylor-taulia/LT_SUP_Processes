WITH ep_prospects_business_case AS (SELECT
          bc.id,
          bc.buyer_name,
          bc.consolidated_buyer_name,
          bc.buyer_company_id,
          bc.iteration_id,
          bc.buyer_type,
          bc.file_source_description,
          CASE WHEN LOWER(bc.file_source_description) = 'platform gap data' 
          THEN 'LIVE Data' 
          ELSE bc.file_source_description 
          END AS file_source_description_rename,
          bc.batch_id,
          bc.scenario_description,
          IFNULL(bc.scenario_friendly_name,bc.scenario_description) AS scenario_friendly_name,
          NULLIF(REPLACE(buyer_capiq_parent_id,".0","),"None") AS buyer_capiq_parent_id,
          bc.iteration_monthtimestamp,
          bc.iteration_datetimestamp,
          bc.program_taulia_cof_margin,
          bc.program_buyer_floor,
          bc.wc_explainer,
          bc.ppm_version,
          CASE WHEN STRPOS(bc.yield_explainer, "{looker_buyer_floor_and_budget_placeholder}") > 0 THEN
            REPLACE (bc.yield_explainer,
                    '{looker_buyer_floor_and_budget_placeholder}',
                      CONCAT(" Buyer floor is ",

                              bc.program_buyer_floor
                              ,
                              "% and maximum allowed funding budget for DD is ",

                              100
                              ,
                              "%"
                            ))
          ELSE
            bc.yield_explainer
          END AS yield_explainer,
          bc.bc_dynamicity,
          cc.name as platform_buyer_name,
          bc.beta as beta,
          bc.funding_budget_for_dd AS funding_budget_for_dd,
          bc.bc_visible AS bc_visible,
          ROW_NUMBER() OVER (PARTITION BY bc.consolidated_buyer_name
            ORDER BY
              CASE WHEN bc.buyer_type = 'Platform Data' THEN CAST('2100-01-01' AS DATE)
               ELSE
                 COALESCE(bc.iteration_datetimestamp, bc.iteration_monthtimestamp)
               END DESC) AS active_flag,


          6 AS buyer_floor_filter_value,



          100 AS funding_asset_percent_value,


        FROM ep_prospects_business_case bc
        INNER JOIN
          (
                   SELECT   buyer_name,
                            buyer_type,
                            file_source_description,
                            max(iteration_monthtimestamp) AS iteration_monthtimestamp
                   FROM     ep_prospects_business_case
                   GROUP BY buyer_name,
                            buyer_type,
                            file_source_description) AS max_business_case
        ON         bc.buyer_name = max_business_case.buyer_name
        AND        bc.buyer_type = max_business_case.buyer_type
        AND        bc.file_source_description = max_business_case.file_source_description
        AND        bc.iteration_monthtimestamp = max_business_case.iteration_monthtimestamp
        LEFT JOIN company cc ON bc.buyer_company_id = cc.platform_company_id

        /* NEW BUYER FLOOR AND FUNDING BUDGET BETA SCENARIO SELECTOR */
        WHERE
            (CAST(bc.ppm_version AS NUMERIC) >= 8.01
            AND LOWER(bc.scenario_description) IN ('executable',
                                                   'custom',
                                                   'dynamic_hybrid_supplier_industry_dso_q3',
                                                   'dynamic_hybrid_harmonized_terms',
                                                   'dynamic_hybrid_no_term_extension'))
            OR
            (CAST(bc.ppm_version AS NUMERIC) < 8.01
            AND LOWER(bc.scenario_description) IN ('executable',
                                                   'custom',
                                                   'scf_supplier_industry_dso_q3',
                                                   'hybrid_harmonized_terms',
                                                   'scf_harmonized_terms',
                                                   'dd_harmonized_terms',
                                                   'dd_buyer_floor_roc'))

        )
  ,  capiq_peer AS (SELECT * FROM (
        SELECT data.*,
               ROW_NUMBER() OVER (PARTITION BY company_id, peer_id ORDER BY fiscalyear_int DESC) as rank
              FROM
              (SELECT

                company_id  AS company_id,
                peer_id AS peer_id,
                exclusion AS exclusion,
                peer_company_name AS peer_company_name,
                simple_industry_description AS simple_industry_description,
                country AS country,
                revenue AS revenue,
                days_payables_outstanding AS days_payables_outstanding,
                fiscalyear AS fiscalyear,
                CAST(fiscalyear AS int64) AS fiscalyear_int
              FROM
              (SELECT
                  DISTINCT
                  IFNULL(peer.company_id,0)  AS company_id,
                  IFNULL(peer.exclude,0) AS exclusion,
                  IFNULL(comp.company_id,0) AS peer_id,
                  IFNULL(comp.company_name,"-") AS peer_company_name,
                  IFNULL(comp.simple_industry_description,"-") AS simple_industry_description,
                  IFNULL(comp.country,"-") AS country,
                  fin.revenue AS revenue,
                  fin.days_payables_outstanding AS days_payables_outstanding,
                  fin.fiscalyear AS fiscalyear,
              FROM
                  ep_prospects_business_case c
                  JOIN capiq_peer_list peer ON CAST(REPLACE(NULLIF(c.buyer_capiq_parent_id,"None"),".0",") AS int64) = peer.company_id
                  JOIN capiq_company_table comp ON peer.peer_id = comp.company_id
                  JOIN capiq_financial_metrics fin ON peer.peer_id = fin.company_id
              WHERE
                  fin.fiscalyear >= EXTRACT(YEAR FROM DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR))
                      AND fin.days_payables_outstanding <= 500
                      AND peer.peer_id <> CAST(REPLACE(NULLIF(c.buyer_capiq_parent_id,"None"),".0",") AS int64)
              UNION ALL
              SELECT
                  DISTINCT
                  IFNULL(comp.company_id,0) AS company_id,
                  0 AS exclusion,
                  IFNULL(comp.company_id,0) AS peer_id,
                  IFNULL(comp_name.name,"-") AS peer_company_name,
                  IFNULL(comp.simple_industry_description,"-") AS simple_industry_description,
                  IFNULL(comp.country,"-") AS country,
                  fin.revenue AS revenue,
                  fin.days_payables_outstanding AS days_payables_outstanding,
                  fin.fiscalyear AS fiscalyear
              FROM
                  ep_prospects_business_case c
                  JOIN capiq_company_table comp ON CAST(REPLACE(NULLIF(c.buyer_capiq_parent_id,"None"),".0",") AS int64) = comp.company_id
                  JOIN company comp_name ON c.buyer_company_id = comp_name.platform_company_id
                  JOIN capiq_financial_metrics fin ON comp.company_id = fin.company_id
              WHERE
                  fin.fiscalyear >= EXTRACT(YEAR FROM DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR))
                      AND fin.days_payables_outstanding <= 500)) data)
            WHERE rank = 1 )
SELECT
    capiq_peer.days_payables_outstanding  AS capiq_peer_days_payables_outstanding,
    capiq_peer.peer_company_name  AS capiq_peer_peer_company_name
FROM ep_prospects_business_case
INNER JOIN capiq_peer ON capiq_peer.company_id = (CAST(ep_prospects_business_case.buyer_capiq_parent_id AS int64))
WHERE (COALESCE(ep_prospects_business_case.platform_buyer_name ,ep_prospects_business_case.consolidated_buyer_name)) = 'Energizer Holdings, Inc' AND ((ep_prospects_business_case.active_flag ) = 1 AND (CASE
           WHEN DATE_DIFF(CURRENT_DATE, CAST(ep_prospects_business_case.iteration_monthtimestamp AS DATE), DAY) < 180
            OR ep_prospects_business_case.buyer_type = 'Platform Data'
         THEN "Recent" ELSE "Archive" END ) = 'Recent') AND (((capiq_peer.exclusion ) <> 1 OR (capiq_peer.exclusion ) IS NULL) AND ((((( ep_prospects_business_case.buyer_company_id  ) IS NOT NULL))) AND ((CASE
           WHEN DATE_DIFF(CURRENT_DATE, CAST(ep_prospects_business_case.iteration_monthtimestamp AS DATE), DAY) < 365
           OR ep_prospects_business_case.buyer_type = 'Platform Data'
         THEN 0 ELSE 1 END) = 0 )))
GROUP BY
    1,
    2
ORDER BY
    1 DESC
LIMIT 5000


https://looker.na1prd-bi.taulia.com/explore/business_case_set