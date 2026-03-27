CREATE TABLE IF NOT EXISTS edu_c20yy_a (
  id bigint generated always as identity primary key,
  unitid varchar(6),
  cipcode varchar(7),
  majornum smallint,
  awlevel smallint,
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







