TERRAFORM_DIR := terraform
ANSIBLE_DIR := ansible

terraform-init:
	cd $(TERRAFORM_DIR) && terraform init

terraform-destroy:
	cd $(TERRAFORM_DIR) && terraform destroy

terraform-deploy:
	cd $(TERRAFORM_DIR) && terraform apply

terraform-plan:
	cd $(TERRAFORM_DIR) && terraform plan

terraform-format:
	cd $(TERRAFORM_DIR) && terraform fmt .

terraform-validate:
	cd $(TERRAFORM_DIR) && terraform validate .

ansible-setup:
	cd $(ANSIBLE_DIR) && $(MAKE) setup

setup: terraform-deploy ansible-setup
