resource "google_kms_crypto_key" "bigtable_kms_crypto_key" {
  name     = "pike"
  key_ring = google_kms_key_ring.current.id


  rotation_period = "7776000s"

  lifecycle {
    prevent_destroy = true
  }

}
