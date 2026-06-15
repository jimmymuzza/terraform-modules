resource "aws_acmpca_policy" "acmpca_policies" {
  for_each = var.acmpca_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
