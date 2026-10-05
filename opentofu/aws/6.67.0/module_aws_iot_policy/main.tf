resource "aws_iot_policy" "iot_policies" {
  for_each = var.iot_policies

  name     = each.value.name
  policy   = each.value.policy
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
