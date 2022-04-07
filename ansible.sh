#!/bin/bash

cd ansible_jobs
chmod 755 inventory/hosts/ec2.ini
chmod 755 inventory/hosts/ec2.py
pip install boto
withCredentials([sshUserPrivateKey(credentialsId: '4e8fdb4d-d24c-42b5-af0f-0b302b9fbdba', keyFileVariable: 'password', usernameVariable: 'username')]) {
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --u $username --private-key $password playbook/playbook.yml -i inventory/hosts/ec2.py -vvvvv
}  