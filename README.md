# terraform-gcp-bigtable

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/workflows/Verify/badge.svg?branch=main)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-bigtable.svg)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-bigtable.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-bigtable/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-bigtable/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-bigtable&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-bigtable/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-bigtable&benchmark=INFRASTRUCTURE+SECURITY)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-bigtable/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-bigtable&benchmark=CIS+GCP+V1.1)

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
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigtable_instance.bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance) | resource |
| [google_bigtable_table.bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table) | resource |
| [google_kms_crypto_key.bigtable_kms_crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_binding.bigtable_crypto_key_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_project_iam_member.bigtable_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.publisher](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.bigtable](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | <pre>object({<br>    cluster_id   = string<br>    storage_type = string<br>    zone         = string<br>    autoscaling_config = object({<br>      min_nodes      = number<br>      max_nodes      = number<br>      cpu_target     = string<br>      storage_target = string<br>    })<br><br>  })</pre> | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_instance_display_name"></a> [instance\_display\_name](#input\_instance\_display\_name) | n/a | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | n/a | yes |
| <a name="input_key_ring"></a> [key\_ring](#input\_key\_ring) | n/a | `any` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(any)` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | n/a | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_rotation_period"></a> [rotation\_period](#input\_rotation\_period) | n/a | `string` | n/a | yes |
| <a name="input_tables"></a> [tables](#input\_tables) | n/a | <pre>list(object({<br>    name          = string<br>    column_family = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeyVersions.destroy",
    "cloudkms.cryptoKeyVersions.list",
    "cloudkms.cryptoKeys.create",
    "cloudkms.cryptoKeys.get",
    "cloudkms.cryptoKeys.update",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.projects.setIamPolicy"
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

Copyright © 2019-2023 James Woolfenden

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
