#!/bin/bash

# Place All Services Here In This Array
#allServices=(vpc)
#cat env.tfvars >> terraform.tfvars
#for service in ${allServices[@]}; do
#  echo $service
#  cp services/${service}/${service}* .
#  cat ${service}.tfvars >> terraform.tfvars
#done

# READ ALL SERVICES IN THIS ENVIRONMENT FROM THIS FILE
#File="env.cfg"
#services=$(cat $File)
#for service in $services; do
#  echo $service
#  cp services/${service}/${service}* .
#  cat ${service}.tfvars >> terraform.tfvars
#done

# READ ALL SERVICES IN THIS ENVIRONMENT INTO THIS ARRAY
allServices=($(ls services))
cat env.tfvars >> terraform.tfvars
for service in ${allServices[@]}; do
  echo $service
  cp services/${service}/service_${service}* .
  cat service_${service}.tfvars >> terraform.tfvars
done
