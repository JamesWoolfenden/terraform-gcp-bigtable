resource "google_bigtable_table" "bigtable_table" {
  count         = length(var.tables)
  name          = var.tables[count.index].name
  instance_name = google_bigtable_instance.bigtable_instance.name

  lifecycle {
    prevent_destroy = true
  }

  column_family {
    family = var.tables[count.index].column_family
  }
}
