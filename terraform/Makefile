tf-init:
	terraform init -backend-config=secret.backend.tfvars

tf-upgrade:
	terraform init --upgrade -backend-config=secret.backend.tfvars

tf-destroy:
	terraform destroy

tf-deploy:
	terraform apply

tf-plan:
	terraform plan

tf-format:
	terraform fmt .

tf-validate:
	terraform validate .

setup: tf-init tf-deploy

.PHONY: tf-init tf-upgrade tf-destroy tf-deploy tf-plan tf-format tf-validate setup
