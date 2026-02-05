TERRAFORM_DIR := terraform
ANSIBLE_DIR := ansible

ansible-deploy:
	$(MAKE) -C $(ANSIBLE_DIR) setup

ansible-destroy:
	$(MAKE) -C $(ANSIBLE_DIR) rollback

tf-deploy:
	$(MAKE) -C $(TERRAFORM_DIR) setup

tf-destroy:
	$(MAKE) -C $(TERRAFORM_DIR) tf-destroy
	
setup: tf-deploy ansible-deploy

.PHONY: setup
