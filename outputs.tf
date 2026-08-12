output "sa" {
  value       = google_service_account.bigtable
  description = "Service account for bigtable"
}

output "table" {
  value       = google_bigtable_table.table_resource
  description = "The Big table instance details"
}

output "instance" {
  value       = google_bigtable_instance.pike
  description = "The instance details"
  sensitive   = true
}
