variable "environment" {
  type        = string
  description = "The environment name."
  default     = "dev"
}

variable "project" {
  type        = string
  description = "The project name."
}

variable "region" {
  type        = string
  description = "The region the infrastructure will be deployed in."
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC CIDR block."
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet_cidrs" {
  type        = list(string)
  description = "The VPC public subnets used by the Load Balancer."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_eks_private_subnet_cidrs" {
  type        = list(string)
  description = "The VPC private subnets used by the EKS nodes."
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version to use for the EKS cluster."
  default     = "1.24"
}

variable "node_group_ami_type" {
  type        = string
  description = "The Amazon Machine Image used by the EKS Node Group."
  default     = "AL2_x86_64"
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "The instance types of the EKS Node Group."
  default     = ["t3.large"]
}

variable "node_group_min_size" {
  type        = number
  description = "The minimum number of nodes."
  default     = 1
}

variable "node_group_max_size" {
  type        = number
  description = "The maximum number of nodes."
  default     = 4
}

variable "node_group_desired_size" {
  type        = number
  description = "The desired number of nodes."
  default     = 1
}

variable "node_group_disk_size" {
  type        = number
  description = "The disk size in GiB of the nodes."
  default     = 50
}

variable "aws_auth_cm_role_name" {
  type        = string
  description = "The AWS role to be mapped in the aws_auth config map. Without this role, access to the EKS cluster both from the command line and in the AWS console will be limited."
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

variable "public_urls" {
  type        = list(string)
  description = "The URLs the LB lister permits."
}

variable "aws_route_53_zone_id" {
  type        = string
  description = "The Zone ID of the Route53 hosted zone where public records will be created."
}

variable "aws_record_names" {
  type        = map(any)
  description = "The public record names created in the Route53 hosted zone."
}
