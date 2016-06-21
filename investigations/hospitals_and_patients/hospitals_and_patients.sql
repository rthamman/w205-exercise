-- calculate the correlation for total score (hcahps_score + hcahps_consistency_score) vs survey_response_transformed
select corr(sr.total_score,ha.normalized_score) from survey_response_transformed sr, hospitals_aggregate ha where sr.provider_id = ha.provider_id;

