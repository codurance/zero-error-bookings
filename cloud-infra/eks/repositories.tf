resource "aws_ecr_repository" "ecr" {
  name                 = "${local.prefix}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}
