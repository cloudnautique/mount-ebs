#!/bin/sh

EC2_AVAIL_ZONE=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .availabilityZone)
EC2_REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
INSTANCE_ID=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .instanceId)
EBS=$1

until aws ec2 attach-volume --device /dev/xvdb --instance-id $INSTANCE_ID --volume-id $EBS --region $EC2_REGION; do
  echo "Trying to attach ebs volume $EBS"
  sleep 5
done
