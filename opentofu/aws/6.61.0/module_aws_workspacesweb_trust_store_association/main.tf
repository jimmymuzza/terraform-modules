resource "aws_workspacesweb_trust_store_association" "workspacesweb_trust_store_associations" {
  for_each = var.workspacesweb_trust_store_associations

  portal_arn      = each.value.portal_arn
  trust_store_arn = each.value.trust_store_arn
  region          = each.value.region
}
