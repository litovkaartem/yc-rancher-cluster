#!/bin/bash
# Максимально простой скрипт

cd ../yc-terraform

# Просто получаем output и создаем файл
cat > ../yc-ansible/inventory.yml << EOF
[sn]
sn1 ansible_host=$(terraform output -raw external_ip_address_vm_1) ansible_user=alitowka

[wn]
wn ansible_host=$(terraform output -raw external_ip_address_vm_2) ansible_user=alitowka

[rancher]
rancher ansible_host=$(terraform output -raw external_ip_address_vm_3) ansible_user=alitowka

[all:vars]
ansible_ssh_private_key_file=~/.ssh/yc_key
ansible_python_interpreter=/usr/bin/python3
EOF

echo "✅ inventory.yml создан"
cd -
