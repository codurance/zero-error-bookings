locals {
  prefix = "${var.environment}-${var.project}"

  common_tags = {
    project     = var.project,
    environment = var.environment,
    created_by  = "terraform",
  }
}
