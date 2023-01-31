resource "aws_lb_target_group" "http_target_group" {
  name     = "${var.prefix}-http-tg"
  port     = var.http_target_group_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
