CREATE TABLE IF NOT EXISTS edu_c20yy_a (
  id bigint generated always as identity primary key,
  unitid varchar(6),
  cipcode varchar(7),
  majornum varchar(2),
  awlevel varchar(2),
  ctotalt smallint,
  year varchar(4)
);


CREATE TABLE IF NOT EXISTS edu_hd20yy (
  id bigint generated always as identity primary key,
  unitid varchar(6),
  instnm varchar(120),
  ialias varchar(2000),
  addr varchar(100),
  city varchar(30),
  stabbr varchar(2),
  zip varchar(10),
  fips varchar(2),
  sector varchar(2),
  iclevel varchar(2),
  control varchar(2),
  hloffer varchar(2),
  ugoffer varchar(2),
  groffer varchar(2),
  hdegofr1 varchar(2),
  deggrant varchar(2),
  countycd varchar(5),
  countynm varchar(60),
  cngdstcd varchar(4),
  longitud numeric(12,6),
  latitude numeric(12,6)
);


CREATE TABLE IF NOT EXISTS empl_singlefile_qtrly(
  id bigint generated always as identity primary key,
  area_fips varchar(5),
  own_code varchar(1),
  industry_code varchar(6),
  agglvl_code varchar(2),
  size_code varchar(1),
  year varchar(4),
  qtr varchar(1),
  disclosure_code varchar(1),
  qtrly_estabs numeric(9),
  month3_emplvl numeric(9)
);


CREATE TABLE IF NOT EXISTS empl_industry_titles(
  id bigint generated always as identity primary key,
  industry_code varchar(6),
  industry_title varchar(150)
);


CREATE TABLE IF NOT EXISTS empl_ownership_titles(
  id bigint generated always as identity primary key,
  own_code varchar(1),
  own_title varchar(150)
);


CREATE TABLE IF NOT EXISTS edu_cipcodes_2020(
  id bigint generated always as identity primary key,
  cipfamily varchar(2),
  cipcode varchar(7),
  action varchar(50),
  textchange boolean,
  ciptitle varchar(150),
  cipdefinition text,
  crossreferences text,
  examples text
);

CREATE TABLE IF NOT EXISTS fips_code_lookup(
  id bigint generated always as identity primary key,
  state varchar(2),
  statefp varchar(2),
  countyfp varchar(3),
  countyns varchar(8),
  countyname varchar(150),
  classfp varchar(2),
  funcstat varchar(1),
  area_fips varchar(5)
);

CREATE TABLE IF NOT EXISTS edu_c20yy_dict(
  id bigint generated always as identity primary key,
  VarName varchar(25),
  VarNumber numeric(5),
  CodeValue varchar(7),
  ORDINAL_POSITION numeric(3),
  VarName1 varchar(25),
  CodeValue1 varchar(7),
  ValueLabel text,
  Frequency numeric(9),
  Percent numeric(7,3),
  year varchar(4)
);



/*
-- UPDATE fips_code_lookup with missing CT state data

-- INSERT INTO fips_code_lookup (state, statefp, countyfp, countyname, area_fips)
SELECT DISTINCT 
	a.stabbr AS state, 
	'0' || LEFT(a.countycd, 1) AS statefp,
 	RIGHT(a.countycd, 3) AS countyfp, 
	a.countynm AS countyname,
	a.countycd AS area_fips
FROM edu_hd20yy a
LEFT JOIN fips_code_lookup b
	ON a.countycd = b.area_fips
WHERE
	b.area_fips IS NULL
	AND a.countynm IS NOT NULL;


-- CHECK 
SELECT DISTINCT area_fips, state, statefp, countyfp, countyns, countyname, classfp, funcstat
FROM fips_code_lookup
WHERE state = 'CT';
*/

/*
-- INSERT INTO fips_code_lookup (state, statefp, countyfp, countyname, area_fips)
SELECT DISTINCT 
	state, 
	statefp, 
	'999' AS countyfp,
	'not county assignable' AS countyname,
	CASE
		WHEN LEFT(statefp, 1) = '0' THEN RIGHT(statefp, 1) || '999'
		ELSE statefp || '999' 
	END AS area_fips
FROM fips_code_lookup
ORDER BY statefp;

-- CHECK
SELECT * FROM fips_code_lookup WHERE countyfp = '999';
*/

/* Summarized Education Data */
-- vw_edu_summary
 SELECT DISTINCT a.year,
    concat(institution.instnm, ', ', institution.addr, ', ', institution.city, ', ', countylookup.state, ', ', institution.zip) AS institution_address,
    countylookup.state,
    countylookup.area_fips,
    concat(countylookup.countyname, ', ', countylookup.state) AS county_state,
    cip.valuelabel AS program,
        CASE
            WHEN major.codevalue::text = '1'::text THEN 'Major'::text
            ELSE 'Minor'::text
        END AS major_minor,
    awlevel.valuelabel AS award,
    a.ctotalt AS award_total
   FROM edu_c20yy_a a
     LEFT JOIN edu_c20yy_dict cip ON a.cipcode::text = cip.codevalue::text AND a.year::text = cip.year::text AND cip.varname::text = 'CIPCODE'::text
     LEFT JOIN edu_c20yy_dict awlevel ON a.awlevel::text = awlevel.codevalue::text AND a.year::text = awlevel.year::text AND awlevel.varname::text = 'AWLEVEL'::text
     LEFT JOIN edu_c20yy_dict major ON a.majornum::text = major.codevalue::text AND a.year::text = major.year::text AND major.varname::text = 'MAJORNUM'::text
     LEFT JOIN edu_hd20yy institution ON a.unitid::text = institution.unitid::text AND a.year::text = institution.year::text
     LEFT JOIN fips_code_lookup countylookup ON institution.countycd::text = countylookup.area_fips::text
  WHERE a.cipcode::text <> '99'::text AND (institution.stabbr::text <> ALL (ARRAY['FM'::character varying, 'MH'::character varying, 'PW'::character varying]::text[]));

/* Summarized Employment Data */
-- vw_empl_summary_agg75
 SELECT DISTINCT a.year,
    a.area_fips,
    countylookup.countyname,
    countylookup.state,
    concat(countylookup.countyname, ', ', countylookup.state) AS county_state,
    titles.own_title AS institution,
    regexp_replace(industries.industry_title::text, '^[A-Z]{5} [0-9]{3} '::text, ''::text) AS naics_industry,
    a.month3_emplvl AS annual_employment
   FROM empl_singlefile_qtrly a
     LEFT JOIN empl_ownership_titles titles ON a.own_code::text = titles.own_code::text
     LEFT JOIN empl_industry_titles industries ON a.industry_code::text = industries.industry_code::text
     LEFT JOIN fips_code_lookup countylookup ON a.area_fips::text = countylookup.area_fips::text
  WHERE a.agglvl_code::text = '75'::text;

