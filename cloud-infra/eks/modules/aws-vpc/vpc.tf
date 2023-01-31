data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name                         = "${var.prefix}-vpc"
  cidr                         = var.vpc_cidr
  azs                          = data.aws_availability_zones.available.names
  public_subnets               = var.vpc_public_subnet_cidrs
  private_subnets              = var.vpc_eks_private_subnet_cidrs
  enable_nat_gateway           = true
  single_nat_gateway           = true
  enable_dns_hostnames         = true
  create_database_subnet_group = false

  public_subnet_tags = {
    "Name"                                    = "${var.prefix}-public-subnet"
    "kubernetes.io/cluster/${var.prefix}-eks" = "shared"
    "kubernetes.io/role/elb"                  = "1"
  }

  private_subnet_tags = {
    "Name"                                    = "${var.prefix}-eks-private-subnet"
    "kubernetes.io/cluster/${var.prefix}-eks" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }
}
