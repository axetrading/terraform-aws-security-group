# terraform-aws-security-group
Terraform module that will generate security groups and security group rules

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_s3_object.rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_object) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Boolean to create a new security group or use an existing one | `bool` | `false` | no |
| <a name="input_create_security_group_rules"></a> [create\_security\_group\_rules](#input\_create\_security\_group\_rules) | Boolean to create security group rules | `bool` | `false` | no |
| <a name="input_existing_security_group_id"></a> [existing\_security\_group\_id](#input\_existing\_security\_group\_id) | The ID of an existing security group to which rules will be applied if create\_security\_group is false | `string` | `null` | no |
| <a name="input_load_from_s3"></a> [load\_from\_s3](#input\_load\_from\_s3) | Flag to determine if the security group rules should be loaded from S3 | `bool` | `false` | no |
| <a name="input_rules_file_path"></a> [rules\_file\_path](#input\_rules\_file\_path) | The local file path for the security group rules JSON | `string` | `""` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The S3 bucket containing the security group rules JSON | `string` | `""` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | The S3 key (path) of the security group rules JSON | `string` | `""` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The description of the security group | `string` | `null` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where the security group will be created | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
| <a name="output_security_group_rules"></a> [security\_group\_rules](#output\_security\_group\_rules) | Output the security group rules for external usage |
<!-- END_TF_DOCS -->