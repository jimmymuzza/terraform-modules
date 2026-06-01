resource "aws_kinesis_resource_policy" "kinesis_resource_policies" {
  for_each = var.kinesis_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
