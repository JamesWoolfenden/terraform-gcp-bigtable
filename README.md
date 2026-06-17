# terraform-gcp-bigtable

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/workflows/Verify/badge.svg?branch=main)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-bigtable.svg)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-bigtable.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

A working bigtable module with example.

## Usage

Add **module.bigtable.tf** to your code:-

```terraform
module "bigtable" {
    source      ="jameswoolfenden/bigtable/gcp"
    version     = "0.1.1"
    name        = "pike"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_bigtable_instance.pike](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance) | resource |
| [google_bigtable_table.table_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table) | resource |
| [google_bigtable_table_iam_binding.editor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table_iam_binding) | resource |
| [google_service_account.bigtable](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Account identifier (must not be empty) | `string` | n/a | yes |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Account name (must not be empty) | `string` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluste Object | <pre>object({<br/>    cluster_id   = string<br/>    storage_type = string<br/>    zone         = string<br/>    autoscaling_config = object({<br/>      min_nodes      = number<br/>      max_nodes      = number<br/>      cpu_target     = string<br/>      storage_target = string<br/>    })<br/><br/>  })</pre> | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether to enable deletion protection for the Bigtable instance | `bool` | `true` | no |
| <a name="input_instance_display_name"></a> [instance\_display\_name](#input\_instance\_display\_name) | Bigtable instance display name | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Bigtable instance name | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key resource id (e.g. projects/PROJECT/locations/LOCATION/keyRings/KEYRING/cryptoKeys/KEY). | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_tables"></a> [tables](#input\_tables) | List of Bigtable tables to create | <pre>list(object({<br/>    name          = string<br/>    column_family = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_instance"></a> [instance](#output\_instance) | The instance details |
| <a name="output_sa"></a> [sa](#output\_sa) | Service account for bigtable |
| <a name="output_table"></a> [table](#output\_table) | The Big table instance details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

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
    "bigtable.tables.getIamPolicy",
    "bigtable.tables.setIamPolicy",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-gcp-bigtable/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-gcp-bigtable/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2026 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
