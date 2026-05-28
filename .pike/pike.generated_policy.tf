
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "bigtable.clusters.list",
    "bigtable.instances.create",
    "bigtable.instances.delete",
    "bigtable.instances.get",
    "bigtable.instances.list",
    "bigtable.instances.update",
    "bigtable.tables.create",
    "bigtable.tables.delete",
    "bigtable.tables.get",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.projects.setIamPolicy"
  ]
}
