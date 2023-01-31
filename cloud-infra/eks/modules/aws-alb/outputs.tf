output "lb_http_target_group_arn" {
  value       = aws_lb_target_group.http_target_group.arn
  description = "The ARN of the LB HTTP target group."
}

output "lb_security_group_id" {
  value       = aws_security_group.lb_sg.id
  description = "The ID of the LB public security group."
}
