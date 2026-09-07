resource "aws_osis_resource_policy" "osis_resource_policies" {
  for_each = var.osis_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
