resource "aws_redshift_resource_policy" "redshift_resource_policies" {
  for_each = var.redshift_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
