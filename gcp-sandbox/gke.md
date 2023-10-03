Google Kubernetes Engine (GKE) is a managed Kubernetes service that you can use to deploy and operate containerized applications at scale using Google's infrastructure. In this example you will practice creating a GKE cluster, deploying an application and exposing it to the internet. This example was based on the [GKE quickstart](https://cloud.google.com/kubernetes-engine/docs/quickstart) guide. For more information about GKE, see the [GKE documentation](https://cloud.google.com/kubernetes-engine/docs).


Before start, you will need to enable the required services:

```
gcloud services enable compute.googleapis.com container.googleapis.com
```{{execute}}

Now you can create a GKE cluster. The following command will create a cluster with the name `hello-cluster` in the region `us-central1`:

```
gcloud container clusters create-auto hello-cluster --location=us-central1
```{{execute}}

Then run get-credentials to fetch the credentials for a running cluster and to configure the kubectl command-line tool to use the cluster:

```
gcloud container clusters get-credentials hello-cluster --location us-central1
```{{execute}}

Deploy an example application, using the `hello-app` application from the google-samples:

```
kubectl create deployment hello-server --image=us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0
```{{execute}}

Expose the application to the internet:

```
kubectl expose deployment hello-server --type LoadBalancer --port 80 --target-port 8080
```{{execute}}

You can check the status of the cluster and the application with the following commands:

```
kubectl get pods
kubectl get service hello-server
```{{execute}}

Wait for the pod to become ready:

```
pod_id=$(kubectl get pods \
    --output jsonpath='{.items[0].metadata.name}')
kubectl wait pod $pod_id \
    --for condition=Ready \
    --timeout 300s
```{{execute}}

Now you can access the application with the following command:

```
curl http://$(kubectl get service hello-server --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
```{{execute}}

You should see an output similar to this:

``` 
Hello, world!
Version: 1.0.0
Hostname: hello-server-6f5965c86-8kf9b
```

To clean up the resources created by this example, run the following commands, first remove the application:

```
kubectl delete service hello-server
kubectl delete deployment hello-server
```{{execute}}

And then remove the cluster:

```
gcloud container clusters delete hello-cluster --location us-central1
```{{execute}}

