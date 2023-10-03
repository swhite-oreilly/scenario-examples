Cloud Storage is a service for storing your objects in Google Cloud. An object is an immutable piece of data consisting of a file of any format. You store objects in containers called buckets. In this example you will practice managing buckets and objects. This example was based on the [Discover object storage with the gcloud tool guide](https://cloud.google.com/storage/docs/discover-object-storage-gcloud). For more information about Cloud Storage, see the [Cloud Storage documentation](https://cloud.google.com/storage/docs/overview).

To be able to run this example you need to have the storage api enabled in the project. Enable it with the following command:

```
gcloud services enable storage-api.googleapis.com
```{{execute}}

And when that command finishes, you can create a bucket. The example commmand includes the uniform access control parameter. This option configures all objects in the bucket to be publicly readable. Since the buckets should be globally unique, we append a random number to the bucket name. Go ahead and run the following command:

```
gcloud storage buckets create gs://test_bucket$randomNum/ --uniform-bucket-level-access
```{{execute}}

You will see the an output similar to this:

```
Creating gs://test_bucket135891360435/...
```

You can check the status of the bucket with the following command:

```
gcloud storage buckets list
```{{execute}}

Now you can practice uploading objects to the bucket. First, create a test file to use in this example:

```
echo "Hello, World!" >test_file.txt
```{{execute}}

And then upload it to the bucket:

```
gcloud storage cp test_file.txt gs://test_bucket$randomNum/
```{{execute}}


You can list the contents of the bucket with the following command:

```
gcloud storage ls gs://test_bucket$randomNum/
```{{execute}}

Now you can remove the file locally and then download it from the bucket with the following command:

```
rm test_file.txt
```{{execute}}

```
gcloud storage cp gs://test_bucket$randomNum/test_file.txt test_file.txt
```{{execute}}

As you can see, the file was downloaded to the local directory:

```
cat test_file.txt
```{{execute}}

To clean up the resources created by this example, run the following commands, first remove the object:

```
gcloud storage rm gs://test_bucket$randomNum/test_file.txt
```{{execute}}

And then remove the bucket:

```
gcloud storage rm gs://test_bucket$randomNum/ --recursive
```{{execute}}