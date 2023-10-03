Compute Engine is a computing and hosting service that lets you create and run virtual machines on Google infrastructure. In this example you will practice creating, listing, and deleting virtual machines. This example was based on the [Compute Engine quickstart](https://cloud.google.com/compute/docs/instances/create-start-instance). For more information about Compute Engine, see the [Compute Engine documentation](https://cloud.google.com/compute/docs).

To run this example you will need to have the compute api enabled in the project. Enable it with the following command:

```
gcloud services enable compute.googleapis.com
```{{execute}}

When the service is enabled, you can create a VM with the following command. This command will create a VM with the name `testvm` and the machine type `e2-micro` in the zone `us-central1-a`. The zone is the region where the VM will be created. You can find more information about zones [here](https://cloud.google.com/compute/docs/regions-zones). The machine type determines the resources available to the VM that will be created. You can find more information about machine types [here](https://cloud.google.com/compute/docs/machine-types).

```
gcloud compute instances create test-vm --machine-type e2-micro --zone=us-central1-a
```{{execute}}

You can check the status of the VM with the following command:

```
gcloud compute instances list
```{{execute}}

You can also check the status of the VM in the [console](https://console.cloud.google.com/compute/instances).

Now, you can delete the VM with the following command:

```
gcloud compute instances delete test-vm --zone us-central1-a
```{{execute}}