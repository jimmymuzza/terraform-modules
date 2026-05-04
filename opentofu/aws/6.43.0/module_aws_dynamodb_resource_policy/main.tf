resource "aws_dynamodb_resource_policy" "dynamodb_resource_policies" {
  for_each = var.dynamodb_resource_policies

  policy                              = each.value.policy
  resource_arn                        = each.value.resource_arn
  confirm_remove_self_resource_access = each.value.confirm_remove_self_resource_access
  region                              = each.value.region
}
