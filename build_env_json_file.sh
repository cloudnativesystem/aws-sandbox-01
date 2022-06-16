#!/bin/bash

# JSONArray VARIABLE
envArray=[

# READ ALL ENVIRONMENTS INTO THIS ARRAY
allEnvironments=($(ls environments))

# GET TOTAL NUMBER OF ENVIRONMENTS
totalEnvironments=${#allEnvironments[@]}

# SET ENVIRONMENT INDEX
environmentIndex=1

# BUILD JSON ARRAY
for environment in ${allEnvironments[@]}; do
  if [ "$environmentIndex" -lt "$totalEnvironments" ] 
  then
     envArray=${envArray}\"${environment}\",
  elif [ "$environmentIndex" -eq "$totalEnvironments" ] 
  then
     envArray=${envArray}\"${environment}\"
  fi
  environmentIndex=$((environmentIndex+1))
done

envArray=${envArray}]

# WRITE JSON ARRAY TO A FILE
echo $envArray > env.json
