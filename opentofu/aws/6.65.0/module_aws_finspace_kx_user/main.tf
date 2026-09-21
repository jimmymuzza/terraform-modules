resource "aws_finspace_kx_user" "finspace_kx_users" {
  for_each = var.finspace_kx_users

  environment_id = each.value.environment_id
  iam_role       = each.value.iam_role
  name           = each.value.name
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
}
