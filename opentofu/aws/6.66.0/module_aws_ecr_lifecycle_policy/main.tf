resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policies" {
  for_each = var.ecr_lifecycle_policies

  policy     = each.value.policy
  repository = each.value.repository
  region     = each.value.region
}
