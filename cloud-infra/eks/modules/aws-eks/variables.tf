variable "prefix" {
  type        = string
  description = "A prefix appended to the Terraform resource names."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID."
}

variable "vpc_eks_private_subnet_ids" {
  type        = list(string)
  description = "The VPC private subnets used by EKS."
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
  description = "The instance types of the EKS Node Group"
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

variable "lb_http_target_group_arn" {
  type        = string
  description = "The ARN of the LB HTTP target group."
}

variable "common_tags" {
  type        = map(any)
  description = "The common tags that will be added to most Terraform resources."
}
