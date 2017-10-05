
export ANSIBLE_ROLES_PATH=$(pwd)/roles:/etc/ansible/roles

env | sort | grep -v ^LESS_TERMCAP
ansible --version
echo "Installing roles..."
ansible-galaxy install -f -r requirements.yml
### Test: syntax
echo "Test: syntax"
ansible-playbook -i inventory test.yml --syntax-check --list-tasks
#echo "Test: Lint"
#ansible-lint -x ANSIBLE0012,ANSIBLE0013 test.yml
echo "Run test playbook"
ansible-playbook -i inventory test.yml --extra-vars aws_region=us-west-2 -vvvv
