#!/bin/bash


## This Command will give the result in tabular Format.
## ---------------------------------------------------

aws ec2 describe-instances --output table --query 'Reservations[].Instances[].{ Ins_Name:Tags[?Key==`Name`] | [0].Value,State:State.Name, AZ:Placement.AvailabilityZone, Ins_Id:InstanceId, Type:InstanceType, PrivateIP:PrivateIpAddress, PublicIP:PublicIpAddress, VPC_ID:VpcId,  KeyName:KeyName }'



#echo "---------------------------------------------------------------------------------------------------------------------------"
#aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, KeyName, Tags[?Key==`Name`].Value, State.Name, InstanceId, InstanceType, PrivateIpAddress, VpcId]' --output text | sed '$!N;s/\n/ /'
#echo "---------------------------------------------------------------------------------------------------------------------------"
#aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, Name]' --output table
