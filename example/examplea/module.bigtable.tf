# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "bigtable" {
  source                = "../../"
  name                  = "pike"
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
  account_id          = "svc-bigtable-user"
  account_name        = "Service Account for BigTable"
  kms_key_id          = google_kms_crypto_key.bigtable_kms_crypto_key.id
  project_id          = var.project
  deletion_protection = false
  labels              = local.labels
}


locals {
  members = [
    "serviceAccount:service-${data.google_project.current.number}@gcp-sa-bigtable.iam.gserviceaccount.com"
  ]
  labels = {
    pike = "permissions"
  }
}

resource "google_kms_key_ring" "current" {
  project  = var.project
  location = "europe-west2"
  name     = "pike"
}

data "google_project" "current" {
  project_id = var.project
}
