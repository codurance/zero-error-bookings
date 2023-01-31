# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix appended to the Terraform resource names. | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR block. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_eks_private_subnet_cidrs"></a> [vpc\_eks\_private\_subnet\_cidrs](#input\_vpc\_eks\_private\_subnet\_cidrs) | The VPC private subnets used by the EKS nodes. | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24"<br>]</pre> | no |
| <a name="input_vpc_public_subnet_cidrs"></a> [vpc\_public\_subnet\_cidrs](#input\_vpc\_public\_subnet\_cidrs) | The VPC public subnets used by the Load Balancer. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The VPC CIDR block. |
| <a name="output_vpc_eks_private_subnet_cidrs"></a> [vpc\_eks\_private\_subnet\_cidrs](#output\_vpc\_eks\_private\_subnet\_cidrs) | The CIDRs of the VPC private subnets for EKS. |
| <a name="output_vpc_eks_private_subnet_ids"></a> [vpc\_eks\_private\_subnet\_ids](#output\_vpc\_eks\_private\_subnet\_ids) | The IDs of the VPC private subnets for EKS. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC. |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The VPC name. |
| <a name="output_vpc_public_subnet_cidrs"></a> [vpc\_public\_subnet\_cidrs](#output\_vpc\_public\_subnet\_cidrs) | The CIDRs of the VPC public subnets. |
| <a name="output_vpc_public_subnet_ids"></a> [vpc\_public\_subnet\_ids](#output\_vpc\_public\_subnet\_ids) | The IDs of the VPC public subnets. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
