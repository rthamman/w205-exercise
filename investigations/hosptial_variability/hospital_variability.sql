select measure_id, round(avg(score),2), round(variance(score),2) as variance,round(stddev_samp(score),2) from effective_care group by measure_id order by variance;
