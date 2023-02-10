## Deployment steps

### Infrastructure
Set the variable values in the `terraform.tfvars` file then build the infrastructure using make commands

```
terraform init
terraform plan
terraform apply
```


### Application
Clone the prebid-cache application code from Github

```
git clone https://github.com/prebid/prebid-cache.git
```

Update the config.yaml file in the application code to point to the new Redis cluster. See example config file at examples/complete/config.yaml

Build the docker image locally

```
cd ./prebid-cache
docker build --platform linux/amd64 -t <ecr_repository_name> .
```

Then upload it to the ECR repository
```
aws ecr get-login-password --region <region_name> | docker login --username AWS --password-stdin <account_id>.dkr.ecr.<region_name>.amazonaws.com
docker tag <ecr_repository_name>:latest <ecr_uri>:latest
docker push <ecr_uri>:latest
```
