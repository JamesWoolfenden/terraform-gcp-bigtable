# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
# holden:ignore:HLD_PROPOSED_003 — this instance intentionally demonstrates the module's single-cluster default; see module.bigtable_ha below for the HA-configured call site
module "bigtable" {
  source                = "../../"
  instance_display_name = "pike instance"
  instance_name         = "pike"
  tables = [
    {
      name          = "pangpt"
      column_family = "stor"
    },
    {
      name          = "dev_token"
      column_family = "info"
    }
  ]
  cluster = {
    autoscaling_config = {
      cpu_target     = 80
      max_nodes      = 1
      min_nodes      = 1
      storage_target = 5120
    }
    cluster_id   = "pike"
    storage_type = "SSD"
    zone         = "europe-west2"
  }
  account_id   = "svc-bigtable-user"
  account_name = "Service Account for BigTable"
  kms_key_id   = google_kms_crypto_key.bigtable_kms_crypto_key.id
  project_id   = var.project
}

resource "google_kms_key_ring" "current" {
  project  = var.project
  location = "europe-west2"
  name     = "pike"
}

# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
# Demonstrates opting into multi-cluster replication via var.replica_clusters,
# unlike module.bigtable above which stays single-cluster (the default).
module "bigtable_ha" {
  source                = "../../"
  instance_display_name = "pike ha instance"
  instance_name         = "pike-ha"
  tables = [
    {
      name          = "pangpt"
      column_family = "stor"
    }
  ]
  cluster = {
    autoscaling_config = {
      cpu_target     = 80
      max_nodes      = 1
      min_nodes      = 1
      storage_target = 5120
    }
    cluster_id   = "pike-ha-a"
    storage_type = "SSD"
    zone         = "europe-west2-a"
  }
  replica_clusters = [
    {
      autoscaling_config = {
        cpu_target     = 80
        max_nodes      = 1
        min_nodes      = 1
        storage_target = 5120
      }
      cluster_id   = "pike-ha-b"
      storage_type = "SSD"
      zone         = "europe-west2-b"
    }
  ]
  account_id   = "svc-bigtable-ha-user"
  account_name = "Service Account for BigTable HA"
  kms_key_id   = google_kms_crypto_key.bigtable_kms_crypto_key.id
  project_id   = var.project
}
