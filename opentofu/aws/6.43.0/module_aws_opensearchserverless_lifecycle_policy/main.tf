resource "aws_opensearchserverless_lifecycle_policy" "opensearchserverless_lifecycle_policies" {
  for_each = var.opensearchserverless_lifecycle_policies

  name        = each.value.name
  policy      = each.value.policy
  type        = each.value.type
  description = each.value.description
  region      = each.value.region
}
