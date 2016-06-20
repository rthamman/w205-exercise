#
# Setup and Loading script for w205 Exercise 1 - Rama Thamman
#

# Create a folder called exercise-1 under /data and change to the new directory
mkdir exercise-1
cd exercise-1


# Create folder loading_and_modelling
mkdir loading_and_modelling

# Get data from data from the Centers for Medicare and Medicaid Services (CMS) Hospital Compare project.
wget https://data.medicare.gov/views/bg9k-emty/files/7825b9e4-e595-4f25-86e0-32a68d7ac7a4?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

#sleep 30 seconds for file to complete download
sleep 30s

# rename the file to something simple, say a.zip
mv 7825b9e4-e595-4f25-86e0-32a68d7ac7a4* a.zip

# unpack the zip file
unzip a.zip

# move base data files to loading_and_modelling folder
cp 'Hospital General Information.csv' ./loading_and_modelling/                                                                                                                                                      
cp 'Timely and Effective Care - Hospital.csv' ./loading_and_modelling/                                                                                                                                              
cp 'Readmissions and Deaths - Hospital.csv' ./loading_and_modelling/                                                                                                                                                
cp 'Measure Dates.csv' ./loading_and_modelling/                                                                                                                                                          
cp 'hvbp_hcahps_02_18_2016.csv' ./loading_and_modelling/

# change directory to loading_and_modelling
cd ./loading_and_modelling

# remove header line
tail -n +2 'Hospital General Information.csv' > hospitals.csv
tail -n +2 'Timely and Effective Care - Hospital.csv' > effective_care.csv
tail -n +2 'Readmissions and Deaths - Hospital.csv' > readmissions.csv
tail -n +2 'Measure Dates.csv' > Measures.csv
tail -n +2 'hvbp_hcahps_02_18_2016.csv' > surveys_responses.csv

# clean up the files
\rm -fr 'Hospital General Information.csv'                                                                                                                                                      
\rm -fr 'Timely and Effective Care - Hospital.csv'
\rm -fr 'Readmissions and Deaths - Hospital.csv'
\rm -fr 'Measure Dates.csv'
\rm -fr 'hvbp_hcahps_02_18_2016.csv'

# clean up the zip extract
cd ..
\rm -fr *.csv
\rm -fr *.zip
\rm -fr *.pdf
\rm -fr *.txt