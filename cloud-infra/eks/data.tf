data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_name
}
