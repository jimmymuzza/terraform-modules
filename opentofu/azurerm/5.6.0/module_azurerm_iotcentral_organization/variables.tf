variable "iotcentral_organizations" {
  description = <<EOT
Map of iotcentral_organizations, attributes below
Required:
    - display_name
    - iotcentral_application_id
    - organization_id
Optional:
    - parent_organization_id
EOT

  type = map(object({
    display_name              = string
    iotcentral_application_id = string
    organization_id           = string
    parent_organization_id    = optional(string)
  }))
}
