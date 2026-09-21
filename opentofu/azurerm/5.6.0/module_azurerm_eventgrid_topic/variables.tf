variable "eventgrid_topics" {
  description = <<EOT
Map of eventgrid_topics, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - inbound_ip_rule
    - input_schema
    - local_auth_enabled
    - public_network_access_enabled
    - tags
    - identity
    - input_mapping_default_values
    - input_mapping_fields
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    inbound_ip_rule               = optional(list(object({
            action = string
            ip_mask = string
        })))
    input_schema                  = optional(string)
    local_auth_enabled            = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    input_mapping_default_values  = optional(list(object({
            data_version = optional(string)
            event_type   = optional(string)
            subject      = optional(string)
        })))
    input_mapping_fields          = optional(list(object({
            data_version = optional(string)
            event_time   = optional(string)
            event_type   = optional(string)
            subject      = optional(string)
            topic        = optional(string)
        })))
  }))
}
