resource "aws_iam_instance_profile" "iam_instance_profiles" {
  for_each = var.iam_instance_profiles

  name        = each.value.name
  name_prefix = each.value.name_prefix
  path        = each.value.path
  role        = each.value.role
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
