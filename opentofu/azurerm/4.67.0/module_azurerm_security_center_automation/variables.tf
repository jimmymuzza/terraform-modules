variable "security_center_automations" {
  description = <<EOT
Map of security_center_automations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scopes
    - action
    - source
Optional:
    - description
    - enabled
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = optional(string)
    enabled             = optional(bool)
    tags                = optional(map(string))
    action              = list(object({
            resource_id       = string
            connection_string = optional(string)
            trigger_url       = optional(string)
            type              = optional(string)
        }))
    source              = list(object({
            event_source = string
            rule_set     = optional(list(object({
                rule = list(object({
                    expected_value = string
                    operator       = string
                    property_path  = string
                    property_type  = string
                }))
            })))
        }))
  }))
}
