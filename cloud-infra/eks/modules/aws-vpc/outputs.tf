output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC."
}

output "vpc_name" {
  value       = module.vpc.name
  description = "The VPC name."
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "The VPC CIDR block."
}

output "vpc_public_subnet_ids" {
  value       = module.vpc.public_subnets
  description = "The IDs of the VPC public subnets."
}

output "vpc_public_subnet_cidrs" {
  value       = var.vpc_public_subnet_cidrs
  description = "The CIDRs of the VPC public subnets."
}

output "vpc_eks_private_subnet_ids" {
  value       = module.vpc.private_subnets
  description = "The IDs of the VPC private subnets for EKS."
}

output "vpc_eks_private_subnet_cidrs" {
  value       = var.vpc_eks_private_subnet_cidrs
  description = "The CIDRs of the VPC private subnets for EKS."
}
