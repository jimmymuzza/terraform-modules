resource "aws_grafana_workspace_saml_configuration" "grafana_workspace_saml_configurations" {
  for_each = var.grafana_workspace_saml_configurations

  editor_role_values      = each.value.editor_role_values
  workspace_id            = each.value.workspace_id
  admin_role_values       = each.value.admin_role_values
  allowed_organizations   = each.value.allowed_organizations
  email_assertion         = each.value.email_assertion
  groups_assertion        = each.value.groups_assertion
  idp_metadata_url        = each.value.idp_metadata_url
  idp_metadata_xml        = each.value.idp_metadata_xml
  login_assertion         = each.value.login_assertion
  login_validity_duration = each.value.login_validity_duration
  name_assertion          = each.value.name_assertion
  org_assertion           = each.value.org_assertion
  region                  = each.value.region
  role_assertion          = each.value.role_assertion
}
