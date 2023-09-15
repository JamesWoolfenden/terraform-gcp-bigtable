
resource "google_service_account" "bigtable" {
  account_id   = var.account_id
  display_name = var.account_name
}


resource "google_project_iam_member" "bigtable_user" {
  project = var.project_id
  role    = "roles/bigtable.user"
  member  = "serviceAccount:${google_service_account.bigtable.email}"
}

resource "google_project_iam_member" "publisher" {
  project = var.project_id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.bigtable.email}"
}
