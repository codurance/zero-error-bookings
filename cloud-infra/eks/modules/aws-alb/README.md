# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.eks_https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.host_based_routing_from_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.http_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_cert_arn_wildcard"></a> [acm\_cert\_arn\_wildcard](#input\_acm\_cert\_arn\_wildcard) | The certificate used by the LB listener. | `string` | n/a | yes |
| <a name="input_aws_record_names"></a> [aws\_record\_names](#input\_aws\_record\_names) | There needs to be one record for each of the public\_urls. The record value matches the subdomain that will be created in Hosted Zone. | `map(any)` | n/a | yes |
| <a name="input_aws_route_53_zone_id"></a> [aws\_route\_53\_zone\_id](#input\_aws\_route\_53\_zone\_id) | The Hosted Zone ID. The Zone was created manually in AWS. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | n/a | yes |
| <a name="input_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#input\_cluster\_primary\_security\_group\_id) | Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common tags that will be added to most Terraform resources. | `map(any)` | n/a | yes |
| <a name="input_http_target_group_port"></a> [http\_target\_group\_port](#input\_http\_target\_group\_port) | The port used by the HTTP target group. Usually, this is the K8s Ingress HTTP NodePort. | `number` | `30000` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix appended to the Terraform resource names. | `string` | n/a | yes |
| <a name="input_public_urls"></a> [public\_urls](#input\_public\_urls) | The ALB Listener will allow only these URLs to reach the EKS nodes. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID. | `string` | n/a | yes |
| <a name="input_vpc_public_subnet_ids"></a> [vpc\_public\_subnet\_ids](#input\_vpc\_public\_subnet\_ids) | The VPC public subnets used by the LB. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_http_target_group_arn"></a> [lb\_http\_target\_group\_arn](#output\_lb\_http\_target\_group\_arn) | The ARN of the LB HTTP target group. |
| <a name="output_lb_security_group_id"></a> [lb\_security\_group\_id](#output\_lb\_security\_group\_id) | The ID of the LB public security group. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
