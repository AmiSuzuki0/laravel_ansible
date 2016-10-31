# Ansible Install
sudo yum install -y epel-release
sudo yum install -y ansible

# run ansible-playbook
#ansible-playbook -i /vagrant/ansible/host /vagrant/ansible/site.yml -C -D -v
ansible-playbook -i /vagrant/ansible/host /vagrant/ansible/site.yml -D