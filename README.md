# Pipeline Deployment of EKS Cluster in AWS




**Initialize terraform backend providers**

The terraform init command is used to initialize a working directory containing Terraform configuration files.
This downloads all the poviders in the configuration used in talking to the AWS API.

~~~
terraform init
~~~

**Preview terraform actions**

~~~
terraform plan
~~~

**Apply configuration**

Terraform will propose the plan to you and prompt you to approve it before taking actions, we can waive that prompt by using the ```--auto-approve``` flag.

~~~
terraform apply --auto-approve
~~~

**Connecting to the eks-cluter**

 This is done by importing the ```.kube/config``` 
 
~~~
aws eks update-kubeconfig --name myapp-eks-cluster --region eu-west-2
~~~

**Create nginx deployment on k8s cluster**

~~~
kubectl apply -f nginx.yaml
~~~



**Other manual command..**

**set aws configuration through env variables**
~~~
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"
~~~
