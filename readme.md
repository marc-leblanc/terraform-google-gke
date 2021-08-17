## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | name of kubernetes cluster | `any` | n/a | yes |
| initial\_node\_count | initial amount of nodes to deploy for the kubernetes cluster | `string` | `"1"` | no |
| location | location to deploy kubernetes cluster into | `string` | `"us-central1-a"` | no |
| machine\_type | size of the compute resources | `string` | `"n1-standard-1"` | no |
| network | network that the compute resources of the kubernetes cluster are in | `string` | `"default"` | no |
| preemptible | Pre-emptible nodes True/False | `bool` | `true` | no |
| project\_id | GCP Project ID for GKE deployment | `any` | n/a | yes |
| service\_account | The GCP Service Account to be used by the node VMs | `string` | `""` | no |
| subnetwork | n/a | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| gke\_cluster\_ca\_cert | output "gke\_access\_token" { value = data.google\_client\_config.default.access\_token } |
| gke\_connection\_string | n/a |
| gke\_endpoint | n/a |

