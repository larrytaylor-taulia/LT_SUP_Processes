
-- https://taulia.atlassian.net/wiki/spaces/TRAK/pages/966624996/How-to+enable+Multibuyer+feature+in+Buyer+Gateway
-- 1 in order to use the Multibuyer feature in Buyer Gateway the following two tables in *taulia_company* schema needs to be updated:
-- buyer_group  - you would need at least one group
START TRANSACTION;
INSERT INTO taulia_company.buyer_group (date_created, id, name)
VALUES
  (
    now(),
    'SpectrumBrandsGroup',
    'SpectrumBrandsGroup'
  );
commit;



-- 2  buyer_group_association - you would need at least two companies assigned to the previously added buyer group
  START TRANSACTION;
INSERT INTO taulia_company.buyer_group_association (buyer_group_id, company_id, date_created, id)
VALUES
  (
    'SpectrumBrandsGroup',
    '746bd76bdd21409a9c67f29836c9d7cc',
    now(),
    replace(uuid(), '-', '')
  ),
(
    'SpectrumBrandsGroup',
    'b47c3c887c3c401d847cd98d0c9f98a3',
    now(),
    replace(uuid(), '-', '')
  );
commit;
