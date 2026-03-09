resource "aws_iam_user" "iam_users" {
  for_each = var.iam_users

  name                 = each.value.name
  force_destroy        = each.value.force_destroy
  path                 = each.value.path
  permissions_boundary = each.value.permissions_boundary
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
