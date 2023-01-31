resource "aws_route53_record" "route53_record" {
  for_each = var.aws_record_names

  zone_id         = var.aws_route_53_zone_id
  name            = each.value
  type            = "CNAME"
  ttl             = "300"
  records         = [aws_lb.load_balancer.dns_name]
  allow_overwrite = true
}
