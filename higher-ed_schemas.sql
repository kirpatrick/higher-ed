CREATE TABLE IF NOT EXISTS edu_c20yy_a (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  UNITID varchar(6),
  CIPCODE numeric(12,6),
  MAJORNUM smallint,
  AWLEVEL smallint,
  CTOTALT smallint,
  YEAR varchar(4)
);


CREATE TABLE IF NOT EXISTS edu_hd20yy (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  UNITID varchar(6),
  INSTNM varchar(120),
  IALIAS varchar(2000),
  ADDR varchar(100),
  CITY varchar(30),
  STABBR varchar(2),
  ZIP varchar(10),
  FIPS varchar(2),
  SECTOR varchar(2),
  ICLEVEL varchar(2),
  CONTROL varchar(2),
  HLOFFER varchar(2),
  UGOFFER varchar(2),
  GROFFER varchar(2),
  HDEGOFR1 varchar(2),
  DEGGRANT varchar(2),
  COUNTYCD varchar(5),
  COUNTYNM varchar(60),
  CNGDSTCD varchar(4),
  LONGITUD numeric(12,6),
  LATITUDE numeric(12,6)
);


CREATE TABLE IF NOT EXISTS empl_singlefile_qtrly(
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  area_fips varchar(5),
  own_code varchar(1),
  industry_code varchar(6),
  agglvl_code varchar(2),
  size_code varchar(1),
  year varchar(4),
  qtr varchar(1),
  disclosure_code varchar(1),
  qtrly_estabs Numeric(9),
  month3_emplvl Numeric(9)
);


CREATE TABLE IF NOT EXISTS empl_industry_titles(
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  industry_code varchar(6),
  industry_title varchar(150)
);


CREATE TABLE IF NOT EXISTS empl_ownership_titles(
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  own_code varchar(1),
  own_title varchar(150)
);