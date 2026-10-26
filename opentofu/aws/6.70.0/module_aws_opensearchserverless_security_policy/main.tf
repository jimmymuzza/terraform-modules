resource "aws_opensearchserverless_security_policy" "opensearchserverless_security_policies" {
  for_each = var.opensearchserverless_security_policies

  name        = each.value.name
  policy      = each.value.policy
  type        = each.value.type
  description = each.value.description
  region      = each.value.region
}
