# Vault Required IAM
data "google_compute_default_service_account" "default" {
  project = var.project_id
}

# Set K8S Node Service Account - either default or user provided
variable "service_account" {
  default     = ""
  description = "The GCP Service Account to be used by the node VMs"
}

resource "google_container_cluster" "kubernetes_cluster" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.location

  initial_node_count = var.initial_node_count
  network            = var.network
  subnetwork         = var.subnetwork

  node_config {
    preemptible     = var.preemptible
    machine_type    = var.machine_type
    service_account = (var.service_account != "" ? var.service_account : data.google_compute_default_service_account.default.email)
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloudkms"
    ]
  }
  # depends_on = [google_compute_network.vpc_network] #Uncomment if creating google_compute_network.vpc_network below
}

variable "project_id" {
  description = "GCP Project ID for GKE deployment"
}


variable "location" {
  description = "location to deploy kubernetes cluster into"
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "name of kubernetes cluster"
}

variable "initial_node_count" {
  description = "initial amount of nodes to deploy for the kubernetes cluster"
  default     = "1"
}

variable "network" {
  description = "network that the compute resources of the kubernetes cluster are in"
  default     = "default"
}

variable "subnetwork" {
  default = "default"
}

variable "machine_type" {
  description = "size of the compute resources"
  default     = "n1-standard-1"
}

variable "preemptible" {
  description = "Pre-emptible nodes True/False"
  default     = true
}

variable "cert_manager_install" {
  description = "Install cert-manager"
  default     = false
}
resource "helm_release" "cert-manager" {
  count      = var.cert_manager_install ? 1 : 0
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  create_namespace = true
}


output "gke_endpoint" {
  value = google_container_cluster.kubernetes_cluster.endpoint
}

output "gke_cluster_ca_cert" {
  value = google_container_cluster.kubernetes_cluster.master_auth.0.cluster_ca_certificate
}

output "gke_connection_string" {
  value = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.location} --project ${var.project_id}"
  depends_on = [
    google_container_cluster.kubernetes_cluster
  ]
}
data "google_client_config" "default" {}
provider "helm" {
  kubernetes {
    host                   = google_container_cluster.kubernetes_cluster.endpoint
    cluster_ca_certificate = base64decode(google_container_cluster.kubernetes_cluster.master_auth.0.cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
