resource "aws_ecr_repository_policy" "ecr_repository_policies" {
  for_each = var.ecr_repository_policies

  policy     = each.value.policy
  repository = each.value.repository
  region     = each.value.region
}
