resource "aws_codeartifact_domain_permissions_policy" "codeartifact_domain_permissions_policies" {
  for_each = var.codeartifact_domain_permissions_policies

  domain          = each.value.domain
  domain_owner    = each.value.domain_owner
  policy_document = each.value.policy_document
  policy_revision = each.value.policy_revision
  region          = each.value.region
}
