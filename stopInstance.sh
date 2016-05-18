#!/bin/bash

echo ""
aws ec2 describe-instances --output table --query 'Reservations[].Instances[].{ Ins_Name:Tags[?Key==`Name`] | [0].Value,State:State.Name, AZ:Placement.AvailabilityZone, Ins_Id:InstanceId, Type:InstanceType, PrivateIP:PrivateIpAddress, PublicIP:PublicIpAddress, VPC_ID:VpcId,  KeyName:KeyName }'

echo ""

read -p "Please Enter Instance Ids (Ins_Id) to stop :" ids

if [[ $i != '' ]]; then
   aws ec2 stop-instances --instance-ids $ids
else
   echo "Given Id(s) seems not to be Valid. Please have a look at given Id(s)."
   echo "IDs: $ids"
   exit 
fi
