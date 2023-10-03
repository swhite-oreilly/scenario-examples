HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. In this example you will practice creating a bucket and uploading an object to it.  This example was based on [Google storage docs](https://cloud.google.com/storage/docs/terraform-create-bucket-upload-object). For more information about Terraform, see the [Terraform documentation](https://www.terraform.io/docs/index.html).

To run this example you will need to have the storage api enabled in the project. If you haven't done so in the previous step, you can do it with the following command:

```
gcloud services enable storage-api.googleapis.com
```{{execute}}

We've included an example terraform module in the `terraform` directory that defines two resources: a bucket and an object. The bucket is created with the uniform access control, which means that all objects in the bucket will be publicly readable.

Take a look at the module:

```
cat terraform/main.tf
```{{execute}}

To run the example, you need to initialize terraform and apply the changes:

```
cd terraform
terraform init
```{{execute}}

This step will run a series of initialization steps in order to prepare the current working directory for use with Terraform. Once it finishes, you can run the plan command to see what changes will be applied:

```
terraform plan
```{{execute}}

Take a look at the plan, you should see that terraform will create a bucket and an object. To apply the changes, run:

```
terraform apply
```{{execute}}

You will be prompted to confirm the changes, type `yes` and hit enter. Terraform will create the resources and output the name of the bucket and the object. 

To verify that the bucket exists, and the file was successfully uploaded, you can go to the Cloud Storage page in the [console](https://console.cloud.google.com/storage/browser) or run the following command:

```
gcloud storage ls $(gcloud storage buckets list --flatten=storage_url --format=json | jq -r .[0])
```{{execute}}

To clean up the resources created by terraform, run:

```
terraform destroy
```{{execute}}

There are many more examples of how to use terraform with GCP in the [terraform docs](https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform) and in the [terraform registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs).