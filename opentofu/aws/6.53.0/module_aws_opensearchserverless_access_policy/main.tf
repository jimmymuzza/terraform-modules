resource "aws_opensearchserverless_access_policy" "opensearchserverless_access_policies" {
  for_each = var.opensearchserverless_access_policies

  name        = each.value.name
  policy      = each.value.policy
  type        = each.value.type
  description = each.value.description
  region      = each.value.region
}
