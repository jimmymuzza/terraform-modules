variable "virtual_desktop_host_pools" {
  description = <<EOT
Map of virtual_desktop_host_pools, attributes below
Required:
    - load_balancer_type
    - location
    - name
    - resource_group_name
    - type
Optional:
    - custom_rdp_properties
    - description
    - friendly_name
    - maximum_sessions_allowed
    - personal_desktop_assignment_type
    - preferred_app_group_type
    - public_network_access
    - start_vm_on_connect
    - tags
    - validate_environment
    - vm_template
    - scheduled_agent_updates
EOT

  type = map(object({
    load_balancer_type               = string
    location                         = string
    name                             = string
    resource_group_name              = string
    type                             = string
    custom_rdp_properties            = optional(string)
    description                      = optional(string)
    friendly_name                    = optional(string)
    maximum_sessions_allowed         = optional(number)
    personal_desktop_assignment_type = optional(string)
    preferred_app_group_type         = optional(string)
    public_network_access            = optional(string)
    start_vm_on_connect              = optional(bool)
    tags                             = optional(map(string))
    validate_environment             = optional(bool)
    vm_template                      = optional(string)
    scheduled_agent_updates          = optional(list(object({
            enabled                   = optional(bool)
            timezone                  = optional(string)
            use_session_host_timezone = optional(bool)
            schedule                  = optional(list(object({
                day_of_week = string
                hour_of_day = number
            })))
        })))
  }))
}
