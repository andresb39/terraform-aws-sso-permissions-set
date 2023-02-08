[![Run Pre-Commit](https://github.com/andresb39/aws_sso_permission_set/actions/workflows/pre-commit.yaml/badge.svg?branch=main)](https://github.com/andresb39/aws_sso_permission_set/actions/workflows/pre-commit.yaml)
# Amazon SSO Permission set

This module create identity groups and attachment policies inlines/managed and associated this groups with the accounts


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_identitystore_group.identitystore_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group) | resource |
| [aws_ssoadmin_account_assignment.account_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_ssoadmin_managed_policy_attachment.sso_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_managed_policy_attachment) | resource |
| [aws_ssoadmin_permission_set.sso_permission_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_permission_set) | resource |
| [aws_ssoadmin_permission_set_inline_policy.sso_inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_permission_set_inline_policy) | resource |
| [aws_identitystore_group.identitystore_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_ssoadmin_instances.sso](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Permissions set group description | `string` | `""` | no |
| <a name="input_description_identity"></a> [description\_identity](#input\_description\_identity) | (Optional) A string containing the description of the group. | `string` | `""` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) A string containing the name of the group. This value is commonly displayed when the group is referenced | `string` | `""` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Group name | `string` | `""` | no |
| <a name="input_inline_policy"></a> [inline\_policy](#input\_inline\_policy) | Inline policies JSON to attach to SSO Permissions Set | `string` | `""` | no |
| <a name="input_policy_attachment"></a> [policy\_attachment](#input\_policy\_attachment) | ARN of the policy attachment | `list(string)` | `[]` | no |
| <a name="input_session_duration"></a> [session\_duration](#input\_session\_duration) | The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H | `string` | `"PT2H"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | (Required, Forces new resource) An AWS account identifier, typically a 10-12 digit string. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | Group ID |
<!-- END_TF_DOCS -->
