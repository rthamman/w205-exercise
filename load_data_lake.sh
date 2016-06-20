
# load raw data files to HDFS

hdfs dfs -mkdir /user/w205/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospitals

hdfs dfs -mkdir /user/w205/effective_care
hdfs dfs -put effective_care.csv /user/w205/effective_care

hdfs dfs -mkdir /user/w205/readmission
hdfs dfs -put readmissions.csv /user/w205/readmission

hdfs dfs -mkdir /user/w205/measures
hdfs dfs -put Measures.csv /user/w205/measures

hdfs dfs -mkdir /user/w205/survey_responses
hdfs dfs -put surveys_responses.csv /user/w205/survey_responses