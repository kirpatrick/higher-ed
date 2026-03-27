# Higher education labor market alignment
### This <u>*work-in-progress*</u> seeks to understand how post high school education achievement matches actual employment in the United States.

## Project Overview
Compare the number of annual higher education awards/degrees conferred by program for a county to the county's employment level by industry at the same point in time.

## Approach
1. Preliminary Research: Find credible data<br><br>

2. Data Collection: Capture, clean, and load (CSV) data to Postgresql<br>
See Jupyter notebooks, [database diagram](https://github.com/kirpatrick/higher-ed/blob/main/db_diagram.png), and [higher-ed_schemas](https://github.com/kirpatrick/higher-ed/blob/main/higher-ed_schemas.sql) in this repository for details.<br><br>

3. Data Analysis:  **IN PROGRESS**
<br>- Create views to summarized SQL tables
<br>- Analyze data views using Tableau (and/or Power BI)<br><br>

4. Summarize & Publish Findings: TBD<br><br>

5. Report Possible Next Steps: TBD<br><br>

## Data
- National Center for Education Statistics (NCES) Completions - Awards/degrees conferred by program<br />
https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx
  - C20204_A.CSV and C20203_A.CSV -
  Awards/degrees conferred by program (6-digit CIP code), award level, race/ethnicity, and gender (e.g. 2024 data captures July 1, 2023 to June 30, 2024 awards/degree conferment)
  - HD2024.CSV and HD2023.CSV -
  Institutional characteristics; Directory information
  - CIPCode2020.CSV -
  The classification of instructional program (CIP), degree/award titles and descriptions

- United States Bureau of Labor Statistics (BLS) Quarterly Census of Employment and Wages (QCEW) using the North American Industry Classification System (NAICS)<br />
https://www.bls.gov/cew/downloadable-data-files.htm
  - Quarterly Single Files (.zip) for 2023 and 2024 (e.g. 2023.q1-q4.singlefile.csv)
  - QCEW Industry Codes and Titles for 2022-forward (e.g. industry-titles.csv, [2022 version](https://www.bls.gov/cew/classifications/industry/naics-2022.htm))
  - QCEW Ownership Titles for NAICS-Based Data (e.g. ownership-titles-csv.csv, [last modified 2020](https://www.bls.gov/cew/classifications/ownerships/ownership-titles.htm))

- United States Federal Information Processing Series (FIPS) - 2020 Census codes for Counties and County Equivalent Entities<br>
https://www.census.gov/library/reference/code-lists/ansi.html?#cou
  
## Results


## Possible Next Steps


## References 

National Center for Education Statistics. (n.d.). IPEDS Data Center: Data files. U.S. Department of Education. Retrieved March 25, 2026, from https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx

National Center for Education Statistics. (n.d.). Classification of Instructional Programs (CIP): Resources. U.S. Department of Education. Retrieved March 25, 2026, from https://nces.ed.gov/ipeds/cipcode/resources.aspx

U.S. Bureau of Labor Statistics. (n.d.). Quarterly Census of Employment and Wages: Downloadable data files. U.S. Department of Labor. Retrieved March 25, 2026, from https://www.bls.gov/cew/downloadable-data-files.htm

U.S. Census Bureau. (n.d.). ANSI and FIPS codes. Retrieved March 26, 2026, from https://www.census.gov/library/reference/code-lists/ansi.html