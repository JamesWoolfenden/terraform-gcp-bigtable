module "bigtable" {
  source                = "../../"
  name                  = "pike"
  instance_display_name = "pike instance"
  instance_name         = "pike"
  members = [
    "serviceAccount:service-${data.google_project.current.number}@gcp-sa-bigtable.iam.gserviceaccount.com"
  ]
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
  key_ring            = data.google_kms_key_ring.current.id
  project_id          = "pike-gcp"
  rotation_period     = "7776000s"
  deletion_protection = false
  labels = {
    pike = "permissions"
  }
}


data "google_kms_key_ring" "current" {
  project  = "pike-gcp"
  location = "europe-west2"
  name     = "pike"
}

data "google_project" "current" {
  project_id = "pike-gcp"
}
