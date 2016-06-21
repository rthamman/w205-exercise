-- select top 10 hospitals based on normalized_score
select provider_id, hospital_name, num_measures, score_sum, round(avg_score,2), normalized_score, round(variance,2), round(sample_variance,2)
 from hospitals_aggregate order by normalized_score desc limit 10; 

-- select top 10
select hospitals_aggregate.provider_id, readmission_aggregate.avg_score, readmission_aggregate.measure_count, hospitals_aggregate.normalized_score from 
 readmission_aggregate full outer join hospitals_aggregate on readmission_aggregate.provider_id = hospitals_aggregate.provider_id 
 where readmission_aggregate.avg_score is not null order by readmission_aggregate.avg_score asc, hospitals_aggregate.normalized_score desc limit 10;
 
 
-- select top 10 hospitals based on normalized_score and readmission score 
select hospitals_aggregate.provider_id, hospitals_aggregate.hospital_name, hospitals_aggregate.num_measures, hospitals_aggregate.score_sum, round(hospitals_aggregate.avg_score,2), hospitals_aggregate.normalized_score, 
round(hospitals_aggregate.variance,2), round(hospitals_aggregate.sample_variance,2), readmission_aggregate.avg_score
from hospitals_aggregate full outer join readmission_aggregate on readmission_aggregate.provider_id = hospitals_aggregate.provider_id order by hospitals_aggregate.normalized_score desc, readmission_aggregate.avg_score asc limit 10;