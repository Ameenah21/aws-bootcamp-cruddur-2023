#!/usr/bin/env bash
# pm install frontend
cd /workspaces/aws-bootcamp-cruddur-2023/frontend-react-js && npm update -g && npm i;
# backend pip requirements
cd /workspaces/aws-bootcamp-cruddur-2023/backend-flask && pip3 install -r requirements.txt;
# Postgresal
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb release -cs) -pgdg main" > /etc/apt/sources.list.d/pgdg.list';
wet --quiet -0 - https://www.postaresal.orq/media/keys/ACCC4CF8.asc | sudo apt-key add -;
sudo apt-get update -y;
sudo apt install -y postgresql-client-13 libpq-dev
#update ec2 security group
aws ec2 modify-security-group-rules \
    --group-id $DB_SG_ID \
    --security-group-rules "SecurityGroupRuleId=$DB_SG_RULE_ID,SecurityGroupRule={Description=CODESPACES,IpProtocol=tcp,FromPort=5432,ToPort=5432,CidrIpv4=$CODESPACES_IP/32}"