resource "google_kms_crypto_key" "bigtable_kms_crypto_key" {
  name            = "pike"
  key_ring        = data.google_kms_key_ring.current.id
  rotation_period = "7776000s"
  labels          = local.labels

  lifecycle {
    prevent_destroy = true
  }

}

resource "google_kms_crypto_key_iam_binding" "bigtable_crypto_key_binding" {
  crypto_key_id = google_kms_crypto_key.bigtable_kms_crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = local.members
}
