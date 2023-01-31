module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.6.0"

  cluster_name                    = "${var.prefix}-eks"
  cluster_version                 = var.cluster_version
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_enabled_log_types       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  enable_irsa                     = false
  vpc_id                          = var.vpc_id
  subnet_ids                      = var.vpc_eks_private_subnet_ids

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "${module.eks_managed_node_group.iam_role_arn}"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes"]
    },
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.aws_auth_cm_role_name}"
      username = "${var.aws_auth_cm_role_name}"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/{{EC2PrivateDNSName}}"
      username = "{{EC2PrivateDNSName}}"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    "${data.aws_caller_identity.current.account_id}",
  ]

  tags = var.common_tags
}

module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"

  name                       = "${var.prefix}-node-group"
  cluster_name               = module.eks.cluster_name
  cluster_version            = var.cluster_version
  subnet_ids                 = var.vpc_eks_private_subnet_ids
  ami_type                   = var.node_group_ami_type
  instance_types             = var.node_group_instance_types
  min_size                   = var.node_group_min_size
  max_size                   = var.node_group_max_size
  desired_size               = var.node_group_desired_size
  disk_size                  = var.node_group_disk_size
  ebs_optimized              = true
  enable_monitoring          = true
  disable_api_termination    = false
  create_launch_template     = false
  use_custom_launch_template = false
  launch_template_name       = ""

  tags = merge(
    var.common_tags,
    {
      Name = "${var.prefix}-node-group"
    }
  )
}
