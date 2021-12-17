# Simple Nginx Pipeline Deployment in an EKS Cluster in AWS

**Platform**

- AWS

**Tools:**

- terraform

- awscli

**Build/Automation Server**

- Jenkins


# Commands

**Initialize terraform backend providers**

~~~
terraform init
~~~

The terraform init command is used to initialize a working directory containing Terraform configuration files.
This downloads all the poviders in the configuration used in talking to the AWS API.



**Preview terraform actions**

~~~
terraform plan
~~~

**Apply configuration**

~~~
terraform apply --auto-approve
~~~

Terraform will propose the plan to you and prompt you to approve it before taking actions, we can waive that prompt by using the ```--auto-approve``` flag.



**Connecting to the eks-cluster**

 
~~~
aws eks update-kubeconfig --name myapp-eks-cluster --region eu-west-2
~~~

importing the ```.kube/config``` using the ```awscli``` tool to connect to the created k8s cluster.

**Creating an nginx deployment on the eks cluster**

~~~
kubectl apply -f nginx.yaml
~~~

The nginx deployment is exposed using the service type ```loadBalancer```


**nginx deployment loadBalancer url:**  http://a32d9b5503b964249a336a3ff66592e0-793688625.eu-west-2.elb.amazonaws.com/



-
**Other manual command..**

**set aws configuration through env variables**
~~~
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"
~~~
