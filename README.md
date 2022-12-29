# Security group Module

- Creating of Security group.
- Provides a security group rule resource. Represents a single ingress or egress group rule, which can be added to external Security Groups.
- Attaching a security group to an Elastic Network Interface (ENI).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.61.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_network_interface_sg_attachment.sg_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_sg_attachment) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.sg_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_sg_rule"></a> [add\_sg\_rule](#input\_add\_sg\_rule) | if true, enable create rules to security group | `bool` | `false` | no |
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | if true, enable create security group | `bool` | `false` | no |
| <a name="input_ec2_id"></a> [ec2\_id](#input\_ec2\_id) | ID of AMI to use for the instance | `string` | `null` | no |
| <a name="input_sg_attachment_to_ec2"></a> [sg\_attachment\_to\_ec2](#input\_sg\_attachment\_to\_ec2) | if true, enable attach security group to Instance | `bool` | `false` | no |
| <a name="input_sg_egress_rules"></a> [sg\_egress\_rules](#input\_sg\_egress\_rules) | all configuration for rules ingress of security group | `any` | `[]` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | (Required) Security group to apply this rule to. | `string` | `null` | no |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | all configuration for rules ingress of security group | `any` | `[]` | no |
| <a name="input_sg_ingress_rules_own"></a> [sg\_ingress\_rules\_own](#input\_sg\_ingress\_rules\_own) | type = map(object({<br>    client-sg = {<br>    # from\_port         = 2,<br>    # to\_port           = 2,<br>    # protocol          = "-1",<br>    # description       = "sg",<br>    # cidr\_blocks       = [],<br>    # ipv6\_cidr\_blocks  = [],<br>    # prefix\_list\_ids   = [],<br>    # self              = null,<br>    # source\_security\_group\_id  = []<br>    }<br>}))<br>Required configuration for attach rule to Sg | `any` | `null` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name to be used on SG created. | `string` | `null` | no |
| <a name="input_sg_type"></a> [sg\_type](#input\_sg\_type) | (Required) Type of rule being created. Valid options are ingress (inbound) or egress (outbound) | `string` | n/a | yes |
| <a name="input_sg_vpc_id"></a> [sg\_vpc\_id](#input\_sg\_vpc\_id) | (Optional, Forces new resource) VPC ID. Defaults to the region's default VPC | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | all tags for all recursives | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id_security_group"></a> [id\_security\_group](#output\_id\_security\_group) | n/a |
