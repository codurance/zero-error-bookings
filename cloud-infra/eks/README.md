# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.52.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.17.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.52.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/aws-alb | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/aws-eks | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/aws-vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.eks_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_cert_arn_wildcard"></a> [acm\_cert\_arn\_wildcard](#input\_acm\_cert\_arn\_wildcard) | The certificate used by the LB listener. | `string` | n/a | yes |
| <a name="input_aws_auth_cm_role_name"></a> [aws\_auth\_cm\_role\_name](#input\_aws\_auth\_cm\_role\_name) | The AWS role to be mapped in the aws\_auth config map. Without this role, access to the EKS cluster both from the command line and in the AWS console will be limited. | `string` | n/a | yes |
| <a name="input_aws_record_names"></a> [aws\_record\_names](#input\_aws\_record\_names) | The public record names created in the Route53 hosted zone. | `map(any)` | n/a | yes |
| <a name="input_aws_route_53_zone_id"></a> [aws\_route\_53\_zone\_id](#input\_aws\_route\_53\_zone\_id) | The Zone ID of the Route53 hosted zone where public records will be created. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version to use for the EKS cluster. | `string` | `"1.24"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | `"dev"` | no |
| <a name="input_http_target_group_port"></a> [http\_target\_group\_port](#input\_http\_target\_group\_port) | The port used by the HTTP target group. Usually, this is the K8s Ingress HTTP NodePort. | `number` | `30000` | no |
| <a name="input_node_group_ami_type"></a> [node\_group\_ami\_type](#input\_node\_group\_ami\_type) | The Amazon Machine Image used by the EKS Node Group. | `string` | `"AL2_x86_64"` | no |
| <a name="input_node_group_desired_size"></a> [node\_group\_desired\_size](#input\_node\_group\_desired\_size) | The desired number of nodes. | `number` | `1` | no |
| <a name="input_node_group_disk_size"></a> [node\_group\_disk\_size](#input\_node\_group\_disk\_size) | The disk size in GiB of the nodes. | `number` | `50` | no |
| <a name="input_node_group_instance_types"></a> [node\_group\_instance\_types](#input\_node\_group\_instance\_types) | The instance types of the EKS Node Group. | `list(string)` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_node_group_max_size"></a> [node\_group\_max\_size](#input\_node\_group\_max\_size) | The maximum number of nodes. | `number` | `4` | no |
| <a name="input_node_group_min_size"></a> [node\_group\_min\_size](#input\_node\_group\_min\_size) | The minimum number of nodes. | `number` | `1` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_public_urls"></a> [public\_urls](#input\_public\_urls) | The URLs the LB lister permits. | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region the infrastructure will be deployed in. | `string` | `"eu-central-1"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR block. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_eks_private_subnet_cidrs"></a> [vpc\_eks\_private\_subnet\_cidrs](#input\_vpc\_eks\_private\_subnet\_cidrs) | The VPC private subnets used by the EKS nodes. | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24"<br>]</pre> | no |
| <a name="input_vpc_public_subnet_cidrs"></a> [vpc\_public\_subnet\_cidrs](#input\_vpc\_public\_subnet\_cidrs) | The VPC public subnets used by the Load Balancer. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
