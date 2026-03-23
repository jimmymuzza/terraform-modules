resource "aws_ecr_registry_policy" "ecr_registry_policies" {
  for_each = var.ecr_registry_policies

  policy = each.value.policy
  region = each.value.region
}
