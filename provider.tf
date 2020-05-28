# provider "vault" {}

##
## Example of using Vault to provide dynamic secrets for GCP provider in 
## Terraform
## 
#data "vault_generic_secret" "gcp_auth" {
#  path = "gcp/key/${var.project_name}-roleset"
#}

#provider "google" {
#    credentials = base64decode(data.vault_generic_secret.gcp_auth.data.private_key_data)
#    project = var.project_name
#}