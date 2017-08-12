.PHONY: init plan apply

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

destroy:
	@echo "Find resource address first: ${INSTANCE_ID}"
	$(eval  RESOURCE_ADDR := $(shell terraform show | sed  -e '/id = ${INSTANCE_ID}/,$$d' | tail -n1 | awk -F: '{print $$1}'))
	@echo "Delete resource address $(RESOURCE_ADDR)"
	$(eval RESOURCES := $(subst ., ,${RESOURCE_ADDR}))
	terraform destroy --target=$(word 1, ${RESOURCES}).$(word 2, ${RESOURCES})[$(word 3, ${RESOURCES})]
