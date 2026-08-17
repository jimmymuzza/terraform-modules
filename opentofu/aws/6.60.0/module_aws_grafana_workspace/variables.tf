variable "grafana_workspaces" {
  description = <<EOT
Map of grafana_workspaces, attributes below
Required:
    - account_access_type
    - authentication_providers
    - permission_type
Optional:
    - configuration
    - data_sources
    - description
    - grafana_version
    - kms_key_id
    - name
    - notification_destinations
    - organization_role_name
    - organizational_units
    - region
    - role_arn
    - stack_set_name
    - tags
    - tags_all
    - network_access_control
    - vpc_configuration
EOT

  type = map(object({
    account_access_type       = string
    authentication_providers  = list(string)
    permission_type           = string
    configuration             = optional(string)
    data_sources              = optional(list(string))
    description               = optional(string)
    grafana_version           = optional(string)
    kms_key_id                = optional(string)
    name                      = optional(string)
    notification_destinations = optional(list(string))
    organization_role_name    = optional(string)
    organizational_units      = optional(list(string))
    region                    = optional(string)
    role_arn                  = optional(string)
    stack_set_name            = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    network_access_control    = optional(list(object({
            prefix_list_ids = set(string)
            vpce_ids        = set(string)
        })))
    vpc_configuration         = optional(list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
        })))
  }))
}
