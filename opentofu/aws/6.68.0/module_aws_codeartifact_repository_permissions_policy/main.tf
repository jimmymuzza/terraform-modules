resource "aws_codeartifact_repository_permissions_policy" "codeartifact_repository_permissions_policies" {
  for_each = var.codeartifact_repository_permissions_policies

  domain          = each.value.domain
  policy_document = each.value.policy_document
  repository      = each.value.repository
  domain_owner    = each.value.domain_owner
  policy_revision = each.value.policy_revision
  region          = each.value.region
}
