![pre-commit](https://github.com/marc-leblanc/terraform-google-gke/workflows/pre-commit/badge.svg)

# Simple GKE Deployment

This GKE demo can be used as a module, to demonstrate a simple GKE build in GCP, or to showcase Terraform fetching dynamic Service Account keys from Vault for a Terraform provider

## Variables 

| Name | Descript | Default | Required |
|--- | --- | --- | --- |
| cluster_name | Name of kubernetes cluster | | yes|
| project_name | GCP (ID) project to deploy kubernetes cluster into | | yes| 
| location | GCP region and zone to deploy into | us-central1-a | yes |
| initial_node_count | initial amount of nodes to deploy for the kubernetes cluster | 1| no | 
| network | | default | no | 
| machine_type | | n1-standard-1 | no|
 