variable "groups" {
  description = <<EOT
Map of groups, attributes below
Required:
    - display_name
Optional:
    - administrative_unit_ids
    - assignable_to_role
    - auto_subscribe_new_members
    - behaviors
    - description
    - external_senders_allowed
    - hide_from_address_lists
    - hide_from_outlook_clients
    - mail_enabled
    - mail_nickname
    - members
    - onpremises_group_type
    - owners
    - prevent_duplicate_names
    - provisioning_options
    - security_enabled
    - theme
    - types
    - visibility
    - writeback_enabled
    - dynamic_membership
EOT

  type = map(object({
    display_name               = string
    administrative_unit_ids    = optional(set(string))
    assignable_to_role         = optional(bool)
    auto_subscribe_new_members = optional(bool)
    behaviors                  = optional(set(string))
    description                = optional(string)
    external_senders_allowed   = optional(bool)
    hide_from_address_lists    = optional(bool)
    hide_from_outlook_clients  = optional(bool)
    mail_enabled               = optional(bool)
    mail_nickname              = optional(string)
    members                    = optional(set(string))
    onpremises_group_type      = optional(string)
    owners                     = optional(set(string))
    prevent_duplicate_names    = optional(bool)
    provisioning_options       = optional(set(string))
    security_enabled           = optional(bool)
    theme                      = optional(string)
    types                      = optional(set(string))
    visibility                 = optional(string)
    writeback_enabled          = optional(bool)
    dynamic_membership         = optional(list(object({
            enabled = bool
            rule    = string
        })))
  }))
}
