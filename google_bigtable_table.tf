resource "google_bigtable_table" "table_resource" {
  project = var.project_id

  for_each      = { for idx, table in var.tables : table.name => table }
  name          = each.value.name
  instance_name = google_bigtable_instance.pike.name

  lifecycle {
    prevent_destroy = true
  }

  column_family {
    family = each.value.column_family
  }
}
