run:
	cd ./vagrant && vagrant up

destroy:
	cd ./vagrant && vagrant destroy -f

provision:
	cd ./vagrant && vagrant provision

ssh:
	cd ./vagrant && vagrant ssh vm-name

terraform-apply:
	cd terraform/ && terraform apply --auto-approve

terraform-destroy:
	cd terraform/ && terraform destroy --force