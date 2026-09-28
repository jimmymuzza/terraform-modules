resource "aws_pinpointsmsvoicev2_resource_policy" "pinpointsmsvoicev2_resource_policies" {
  for_each = var.pinpointsmsvoicev2_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
