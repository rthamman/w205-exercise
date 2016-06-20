DROP TABLE hospitals;
CREATE EXTERNAL TABLE IF NOT EXISTS
hospitals (
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip_code string,
	country_name string,
	phone_number string,
	hospital_type string,
	hospital_ownership string,
	emergency_services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospitals';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE IF NOT EXISTS
effective_care (
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip_code string,
	country_name string,
	phone_number string,
	condition string,
	measure_id string,
	measure_name string,
	score string,
	sample string,
	footnote string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/effective_care';

DROP TABLE readmission;
CREATE EXTERNAL TABLE IF NOT EXISTS
readmission (
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip_code string,
	country_name string,
	phone_number string,
	measure_name string,
	measure_id string,
	compared_to_national string,
	denominator string,
	score string,
	lower_estimate string,
	higher_estimate string,
	footnote string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/readmission';

DROP TABLE measures;
CREATE EXTERNAL TABLE IF NOT EXISTS
measures (
	measure_name string,
	measure_id string,
	measure_start_quarter string,
	measure_start_date string,
	measure_end_quarter string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/measures';

DROP TABLE survey_responses;
CREATE EXTERNAL TABLE IF NOT EXISTS
survey_responses (
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip_code string,
	country_name string,	
	c_n_achievement_points string,
	c_n_improvement_points string,
	c_n_dimension_score string,
	c_d_achievement_points string,
	c_d_improvement_points string,
	c_d_dimension_score string,
	r_h_s_achievement_points string,
	r_h_s_improvement_points string,
	r_h_s_dimension_score string,
	p_m_achievement_points string,
	p_m_improvement_points string,
	p_m_dimension_score string,
	c_m_achievement_points string,
	c_m_improvement_points string,
	c_m_dimension_score string,
	c_q_improvement_points string,
	c_q_achievement_points string,
	c_q_dimension_score string,
	d_i_achievement_points string,
	d_i_improvement_points string,
	d_i_dimension_score string,
	o_r_achievement_points string,
	o_r_improvement_points string,
	o_r_dimension_score string,
	hcahps_score string,
	hcahps_consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/survey_responses';

