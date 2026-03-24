-- SELECT COUNT(*) FROM edu_c20yy_a; --610999
-- SELECT COUNT(*) FROM edu_hd20yy; --12235

-- SELECT COUNT(*) FROM edu_hd20yy WHERE year = '2023'; --6,163

-- SELECT COUNT(*) FROM empl_singlefile_qtrly WHERE year = '2023' AND agglvl_code = '75';

SELECT * 
FROM empl_singlefile_qtrly a
LEFT JOIN empl_industry_titles b
	ON a.industry_code = b.industry_code
WHERE year = '2023' AND agglvl_code = '75' AND area_fips = '48201';

-- ALTER TABLE edu_c20yy_a ALTER COLUMN cipcode TYPE numeric(12,6);

-- SELECT UPPER(column_name), data_type
-- FROM information_schema.columns
-- WHERE table_name = 'edu_hd20yy';

-- SELECT COUNT (*) --610999
-- FROM edu_c20yy_a a
-- LEFT JOIN edu_hd20yy b
-- ON a.unitid = b.unitid
-- AND a.year = b.year;

SELECT b.*, c.area_fips, c.own_code, c.industry_code, c.agglvl_code, c.size_code, c.year, c.qtr, c.qtrly_estabs, c.month3_emplvl --591,064
FROM edu_hd20yy b
LEFT JOIN empl_singlefile_qtrly c
	ON b.countycd = c.area_fips
	AND b.year = c.year
WHERE b.year = '2023' 
AND c.agglvl_code = '75'
AND c.area_fips = '48201'; -- Harris County

-- SELECT COUNT(*) --4,602,520
-- FROM empl_singlefile_qtrly
-- WHERE agglvl_code = '75'; --495,348

-- SELECT COUNT(DISTINCT area_fips) --4,536
-- FROM empl_singlefile_qtrly
-- WHERE agglvl_code = '75'; --3,282

SELECT * FROM empl_ownership_titles;