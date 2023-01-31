resource "aws_autoscaling_attachment" "autoscaling_attachment" {
  autoscaling_group_name = module.eks_managed_node_group.node_group_resources[0].autoscaling_groups[0].name
  lb_target_group_arn    = var.lb_http_target_group_arn
}
