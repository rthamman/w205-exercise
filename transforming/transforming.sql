--transform effective_care data

-- drop effective_care_transformed, if exists
drop table effective_care_transformed;

--create table with rows that have scores greater than or equal to 0
create table effective_care_transformed as select provider_id, measure_id, score from effective_care where score >=0;

--set score to 0 where column value is 'Not Available'
insert into effective_care_transformed select provider_id, measure_id, regexp_replace(score, 'Not Available', 0) as score from effective_care where score = 'Not Available';

--set score to 4 where column value is 'Very High (60,000+ patients annually)'
insert into effective_care_transformed select provider_id, measure_id, regexp_replace(score, 'Very High (60,000+ patients annually)', 4) 
as score from effective_care where score = 'Very High (60,000+ patients annually)';

--set score to 3 where column value is 'High (40,000 - 59,999 patients annually)'
insert into effective_care_transformed select provider_id, measure_id, regexp_replace(score, 'High (40,000 - 59,999 patients annually)', 3) 
as score from effective_care where score = 'High (40,000 - 59,999 patients annually)';

--set score to 2 where column value is 'Medium (20,000 - 39,999 patients annually)'
insert into effective_care_transformed select provider_id, measure_id, regexp_replace(score, 'Medium (20,000 - 39,999 patients annually)', 2) 
as score from effective_care where score = 'Medium (20,000 - 39,999 patients annually)';

--set score to 1 where column value is 'Low (0 - 19,999 patients annually)'
insert into effective_care_transformed select provider_id, measure_id, regexp_replace(score, 'Low (0 - 19,999 patients annually)', 1) 
as score from effective_care where score = 'Low (0 - 19,999 patients annually)';

--create effective_care_summary

--drop table effective_care_summary,if exists
drop table effective_care_summary;

-- create effective_care_summary table
create table effective_care_summary as select provider_id, count(measure_id) as num_measures, sum(score) as score_sum, avg(score) as avg_score,
sum(score)/41 as normalized_score, variance(score) as variance, var_samp(score) as sample_variance from effective_care_transformed group by provider_id;

--drop table hospitals_aggregate, if exists
drop table hospitals_aggregate;
--create hospitals aggregate
create table hospitals_aggregate as select a.provider_id, a.hospital_name, a.state, b.num_measures, b.score_sum, b.avg_score, normalized_score, variance, sample_variance
 from hospitals a, effective_care_summary b where a.provider_id=b.provider_id;
 
--drop table readmission_aggregate, if exists
drop table readmission_aggregate;

--create readmission_aggregate table
create table readmission_aggregate as select provider_id, avg(score) as avg_score, count(measure_id) as measure_count from readmission group by provider_id;

--drop table survey_response_transformed, if exists
drop table survey_response_transformed;

-- create survey_response_transformed
create table survey_response_transformed as select provider_id, (hcahps_score + hcahps_consistency_score) as total_score from survey_responses;