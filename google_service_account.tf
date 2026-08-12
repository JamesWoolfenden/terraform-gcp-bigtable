resource "google_service_account" "bigtable" {
  project      = var.project_id
  account_id   = var.account_id
  display_name = var.account_name
}


resource "google_bigtable_table_iam_member" "editor" {
  for_each      = google_bigtable_table.table_resource
  table         = each.value.name
  instance_name = google_bigtable_instance.pike.name
  role          = "roles/bigtable.user"
  member        = "serviceAccount:${google_service_account.bigtable.email}"
}
