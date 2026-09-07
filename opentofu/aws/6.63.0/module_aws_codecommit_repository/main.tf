resource "aws_codecommit_repository" "codecommit_repositories" {
  for_each = var.codecommit_repositories

  repository_name = each.value.repository_name
  default_branch  = each.value.default_branch
  description     = each.value.description
  kms_key_id      = each.value.kms_key_id
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
