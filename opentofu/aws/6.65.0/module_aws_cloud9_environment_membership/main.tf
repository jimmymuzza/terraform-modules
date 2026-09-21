resource "aws_cloud9_environment_membership" "cloud9_environment_memberships" {
  for_each = var.cloud9_environment_memberships

  environment_id = each.value.environment_id
  permissions    = each.value.permissions
  user_arn       = each.value.user_arn
  region         = each.value.region
}
