variable "prefix" {
  type        = string
  description = "A prefix appended to the Terraform resource names."
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
