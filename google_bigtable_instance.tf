# holden:ignore:HLD_GCP_344: actual cluster count depends on var.replica_clusters, resolved only inside the dynamic "cluster" block below — holden can't evaluate variable values through a dynamic block, so this check can never observe the real cluster count for any caller of this module, whether they set replica_clusters or not. Not a statement that single-cluster is correct for every caller; see var.replica_clusters for the actual HA toggle.
resource "google_bigtable_instance" "pike" {
  project             = var.project_id
  name                = var.instance_name
  display_name        = var.instance_display_name
  deletion_protection = var.deletion_protection

  # a cluster with auto scaling.
  cluster {
    cluster_id   = var.cluster.cluster_id
    storage_type = var.cluster.storage_type
    zone         = var.cluster.zone
    kms_key_name = var.kms_key_id
    autoscaling_config {
      min_nodes      = var.cluster.autoscaling_config.min_nodes
      max_nodes      = var.cluster.autoscaling_config.max_nodes
      cpu_target     = var.cluster.autoscaling_config.cpu_target
      storage_target = var.cluster.autoscaling_config.storage_target
    }
  }

  # Optional replica clusters for multi-cluster replication (HA). Empty by
  # default, so existing single-cluster callers are unaffected.
  dynamic "cluster" {
    for_each = { for c in var.replica_clusters : c.cluster_id => c }
    content {
      cluster_id   = cluster.value.cluster_id
      storage_type = cluster.value.storage_type
      zone         = cluster.value.zone
      kms_key_name = var.kms_key_id
      autoscaling_config {
        min_nodes      = cluster.value.autoscaling_config.min_nodes
        max_nodes      = cluster.value.autoscaling_config.max_nodes
        cpu_target     = cluster.value.autoscaling_config.cpu_target
        storage_target = cluster.value.autoscaling_config.storage_target
      }
    }
  }

  # Prevent accidental deletion of this stateful, CMEK-encrypted instance.
  lifecycle {
    prevent_destroy = true
  }
}
