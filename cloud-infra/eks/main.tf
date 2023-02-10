module "vpc" {
  source = "./modules/aws-vpc"

  vpc_cidr                     = var.vpc_cidr
  vpc_public_subnet_cidrs      = var.vpc_public_subnet_cidrs
  vpc_eks_private_subnet_cidrs = var.vpc_eks_private_subnet_cidrs
  prefix                       = local.prefix
}

module "eks" {
  source = "./modules/aws-eks"

  cluster_version            = var.cluster_version
  node_group_ami_type        = var.node_group_ami_type
  node_group_instance_types  = var.node_group_instance_types
  node_group_min_size        = var.node_group_min_size
  node_group_max_size        = var.node_group_max_size
  node_group_desired_size    = var.node_group_desired_size
  node_group_disk_size       = var.node_group_disk_size
  aws_auth_cm_role_name      = var.aws_auth_cm_role_name
  vpc_id                     = module.vpc.vpc_id
  vpc_eks_private_subnet_ids = module.vpc.vpc_eks_private_subnet_ids
  lb_http_target_group_arn   = module.alb.lb_http_target_group_arn
  prefix                     = local.prefix
  common_tags                = local.common_tags
}

module "alb" {
  source = "./modules/aws-alb"

  public_urls                       = var.public_urls
  aws_record_names                  = var.aws_record_names
  aws_route_53_zone_id              = var.aws_route_53_zone_id
  acm_cert_arn_wildcard             = var.acm_cert_arn_wildcard
  http_target_group_port            = var.http_target_group_port
  vpc_id                            = module.vpc.vpc_id
  cluster_name                      = module.eks.cluster_name
  vpc_public_subnet_ids             = module.vpc.vpc_public_subnet_ids
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  prefix                            = local.prefix
  common_tags                       = local.common_tags
}

resource "aws_ecr_repository" "ecr" {
  name                 = "${local.prefix}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}