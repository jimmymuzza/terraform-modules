variable "emr_studios" {
  description = <<EOT
Map of emr_studios, attributes below
Required:
    - auth_mode
    - default_s3_location
    - engine_security_group_id
    - name
    - service_role
    - subnet_ids
    - vpc_id
    - workspace_security_group_id
Optional:
    - description
    - encryption_key_arn
    - idp_auth_url
    - idp_relay_state_parameter_name
    - region
    - tags
    - tags_all
    - user_role
EOT

  type = map(object({
    auth_mode                      = string
    default_s3_location            = string
    engine_security_group_id       = string
    name                           = string
    service_role                   = string
    subnet_ids                     = set(string)
    vpc_id                         = string
    workspace_security_group_id    = string
    description                    = optional(string)
    encryption_key_arn             = optional(string)
    idp_auth_url                   = optional(string)
    idp_relay_state_parameter_name = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    user_role                      = optional(string)
  }))
}
