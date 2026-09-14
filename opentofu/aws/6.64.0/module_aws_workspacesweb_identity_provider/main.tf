resource "aws_workspacesweb_identity_provider" "workspacesweb_identity_providers" {
  for_each = var.workspacesweb_identity_providers

  identity_provider_details = each.value.identity_provider_details
  identity_provider_name    = each.value.identity_provider_name
  identity_provider_type    = each.value.identity_provider_type
  portal_arn                = each.value.portal_arn
  region                    = each.value.region
  tags                      = each.value.tags
}
