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
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 19.6.0 |
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.autoscaling_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_auth_cm_role_name"></a> [aws\_auth\_cm\_role\_name](#input\_aws\_auth\_cm\_role\_name) | The AWS role to be mapped in the aws\_auth config map. Without this role, access to the EKS cluster both from the command line and in the AWS console will be limited. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version to use for the EKS cluster. | `string` | `"1.24"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common tags that will be added to most Terraform resources. | `map(any)` | n/a | yes |
| <a name="input_lb_http_target_group_arn"></a> [lb\_http\_target\_group\_arn](#input\_lb\_http\_target\_group\_arn) | The ARN of the LB HTTP target group. | `string` | n/a | yes |
| <a name="input_node_group_ami_type"></a> [node\_group\_ami\_type](#input\_node\_group\_ami\_type) | The Amazon Machine Image used by the EKS Node Group. | `string` | `"AL2_x86_64"` | no |
| <a name="input_node_group_desired_size"></a> [node\_group\_desired\_size](#input\_node\_group\_desired\_size) | The desired number of nodes. | `number` | `1` | no |
| <a name="input_node_group_disk_size"></a> [node\_group\_disk\_size](#input\_node\_group\_disk\_size) | The disk size in GiB of the nodes. | `number` | `50` | no |
| <a name="input_node_group_instance_types"></a> [node\_group\_instance\_types](#input\_node\_group\_instance\_types) | The instance types of the EKS Node Group | `list(string)` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_node_group_max_size"></a> [node\_group\_max\_size](#input\_node\_group\_max\_size) | The maximum number of nodes. | `number` | `4` | no |
| <a name="input_node_group_min_size"></a> [node\_group\_min\_size](#input\_node\_group\_min\_size) | The minimum number of nodes. | `number` | `1` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix appended to the Terraform resource names. | `string` | n/a | yes |
| <a name="input_vpc_eks_private_subnet_ids"></a> [vpc\_eks\_private\_subnet\_ids](#input\_vpc\_eks\_private\_subnet\_ids) | The VPC private subnets used by EKS. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with the cluster. |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint of the EKS cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the EKS cluster. |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | Cluster security group created by AWS. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
