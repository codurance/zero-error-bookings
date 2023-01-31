resource "aws_lb_listener" "eks_https_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_cert_arn_wildcard

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_target_group.arn
  }
}

resource "aws_lb_listener_rule" "host_based_routing_from_https" {
  listener_arn = aws_lb_listener.eks_https_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_target_group.arn
  }

  condition {
    host_header {
      values = var.public_urls
    }
  }
}
