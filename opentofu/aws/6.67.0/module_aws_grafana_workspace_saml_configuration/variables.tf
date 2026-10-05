variable "grafana_workspace_saml_configurations" {
  description = <<EOT
Map of grafana_workspace_saml_configurations, attributes below
Required:
    - editor_role_values
    - workspace_id
Optional:
    - admin_role_values
    - allowed_organizations
    - email_assertion
    - groups_assertion
    - idp_metadata_url
    - idp_metadata_xml
    - login_assertion
    - login_validity_duration
    - name_assertion
    - org_assertion
    - region
    - role_assertion
EOT

  type = map(object({
    editor_role_values      = list(string)
    workspace_id            = string
    admin_role_values       = optional(list(string))
    allowed_organizations   = optional(list(string))
    email_assertion         = optional(string)
    groups_assertion        = optional(string)
    idp_metadata_url        = optional(string)
    idp_metadata_xml        = optional(string)
    login_assertion         = optional(string)
    login_validity_duration = optional(number)
    name_assertion          = optional(string)
    org_assertion           = optional(string)
    region                  = optional(string)
    role_assertion          = optional(string)
  }))
}
