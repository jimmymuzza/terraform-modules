resource "aws_redshiftserverless_resource_policy" "redshiftserverless_resource_policies" {
  for_each = var.redshiftserverless_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
