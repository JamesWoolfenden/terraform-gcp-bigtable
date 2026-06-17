data "google_project" "current" {
  project_id = var.project_id
}

resource "google_kms_crypto_key_iam_binding" "bigtable_crypto_key_binding" {
  crypto_key_id = var.kms_key_id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.current.number}@gcp-sa-bigtable.iam.gserviceaccount.com"
  ]
}
