resource "aws_ecr_pull_through_cache_rule" "ecr_pull_through_cache_rules" {
  for_each = var.ecr_pull_through_cache_rules

  ecr_repository_prefix      = each.value.ecr_repository_prefix
  upstream_registry_url      = each.value.upstream_registry_url
  credential_arn             = each.value.credential_arn
  custom_role_arn            = each.value.custom_role_arn
  region                     = each.value.region
  upstream_repository_prefix = each.value.upstream_repository_prefix
}
