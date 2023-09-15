resource "google_bigtable_instance" "bigtable_instance" {
  project             = var.project_id
  name                = var.instance_name
  display_name        = var.instance_display_name
  deletion_protection = var.deletion_protection

  # a cluster with auto scaling.
  cluster {
    cluster_id   = var.cluster.cluster_id
    storage_type = var.cluster.storage_type
    zone         = var.cluster.zone
    kms_key_name = google_kms_crypto_key.bigtable_kms_crypto_key.id
    autoscaling_config {
      min_nodes      = var.cluster.autoscaling_config.min_nodes
      max_nodes      = var.cluster.autoscaling_config.max_nodes
      cpu_target     = var.cluster.autoscaling_config.cpu_target
      storage_target = var.cluster.autoscaling_config.storage_target
    }
  }

  labels = var.labels
}

variable "instance_name" {
  type        = string
  description = ""
}

variable "instance_display_name" {
  type        = string
  description = ""
}
