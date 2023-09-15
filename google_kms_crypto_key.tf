resource "google_kms_crypto_key" "bigtable_kms_crypto_key" {
  #checkov:skip=CKV_GCP_82: deletion protect can be difficult for tf
  name            = var.name
  key_ring        = var.key_ring
  rotation_period = var.rotation_period
  labels          = var.labels
}

resource "google_kms_crypto_key_iam_binding" "bigtable_crypto_key_binding" {
  crypto_key_id = google_kms_crypto_key.bigtable_kms_crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = var.members
}


variable "key_ring" {
}
