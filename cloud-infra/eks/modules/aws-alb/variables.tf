variable "prefix" {
  type        = string
  description = "A prefix appended to the Terraform resource names."
}

variable "acm_cert_arn_wildcard" {
  type        = string
  description = "The certificate used by the LB listener."
}

variable "http_target_group_port" {
  type        = number
  description = "The port used by the HTTP target group. Usually, this is the K8s Ingress HTTP NodePort."
  default     = 30000
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID."
}

variable "vpc_public_subnet_ids" {
  type        = list(string)
  description = "The VPC public subnets used by the LB."
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

variable "cluster_primary_security_group_id" {
  type        = string
  description = "Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console."
}

variable "public_urls" {
  type        = list(string)
  description = "The ALB Listener will allow only these URLs to reach the EKS nodes."
}

variable "aws_record_names" {
  type        = map(any)
  description = "There needs to be one record for each of the public_urls. The record value matches the subdomain that will be created in Hosted Zone."
}

variable "aws_route_53_zone_id" {
  type        = string
  description = "The Hosted Zone ID. The Zone was created manually in AWS."
}

variable "common_tags" {
  type        = map(any)
  description = "The common tags that will be added to most Terraform resources."
}
