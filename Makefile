# Makefile

# Terraform
init:
	cd ./terraform; terraform init

plan:
	cd ./terraform; terraform plan

apply:
	cd ./terraform; terraform apply


# image will build a docker image
REGION = us-east-1
REPO = prebid-cache-dev-repo

# Build a docker image which runs the binary
# Need to deploy infra before image build since redis connection details are required for config.yaml
image:
	cd ./application; docker build --platform linux/amd64 -t ${REPO} .

deploy-image: image
	$(eval DATE := $(shell date +'%Y%m%d%H%M%S'))
	$(eval URI := $(shell aws ecr describe-repositories --region ${REGION} --repository-names ${REPO} | jq -r '.repositories[0] | .repositoryUri'))
	aws ecr get-login-password | docker login --password-stdin --username AWS $(URI)
	docker tag ${REPO}:latest $(URI):$(DATE)
	docker tag ${REPO}:latest $(URI):latest
	aws ecr batch-delete-image --repository-name ${REPO} --image-ids imageTag=latest
	docker push $(URI):$(DATE)
	docker push $(URI):latest
	echo $(URI)
