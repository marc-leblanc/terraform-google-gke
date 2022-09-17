## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.34.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [helm_release.cert-manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_compute_default_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_install"></a> [cert\_manager\_install](#input\_cert\_manager\_install) | Install cert-manager | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | name of kubernetes cluster | `any` | n/a | yes |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | initial amount of nodes to deploy for the kubernetes cluster | `string` | `"1"` | no |
| <a name="input_location"></a> [location](#input\_location) | location to deploy kubernetes cluster into | `string` | `"us-central1-a"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | size of the compute resources | `string` | `"n1-standard-1"` | no |
| <a name="input_network"></a> [network](#input\_network) | network that the compute resources of the kubernetes cluster are in | `string` | `"default"` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Pre-emptible nodes True/False | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID for GKE deployment | `any` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The GCP Service Account to be used by the node VMs | `string` | `""` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | n/a | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gke_cluster_ca_cert"></a> [gke\_cluster\_ca\_cert](#output\_gke\_cluster\_ca\_cert) | n/a |
| <a name="output_gke_connection_string"></a> [gke\_connection\_string](#output\_gke\_connection\_string) | n/a |
| <a name="output_gke_endpoint"></a> [gke\_endpoint](#output\_gke\_endpoint) | n/a |
