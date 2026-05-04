variable "nginx_deployments" {
  description = <<EOT
Map of nginx_deployments, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - automatic_upgrade_channel
    - capacity
    - diagnose_support_enabled
    - email
    - managed_resource_group
    - tags
    - auto_scale_profile
    - frontend_private
    - frontend_public
    - identity
    - logging_storage_account
    - network_interface
    - web_application_firewall
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    sku                       = string
    automatic_upgrade_channel = optional(string)
    capacity                  = optional(number)
    diagnose_support_enabled  = optional(bool)
    email                     = optional(string)
    managed_resource_group    = optional(string)
    tags                      = optional(map(string))
    auto_scale_profile        = optional(list(object({
            max_capacity = number
            min_capacity = number
            name         = string
        })))
    frontend_private          = optional(list(object({
            allocation_method = string
            ip_address        = string
            subnet_id         = string
        })))
    frontend_public           = optional(list(object({
            ip_address = optional(list(string))
        })))
    identity                  = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    logging_storage_account   = optional(list(object({
            container_name = optional(string)
            name           = optional(string)
        })))
    network_interface         = optional(list(object({
            subnet_id = string
        })))
    web_application_firewall  = optional(list(object({
            activation_state_enabled = bool
        })))
  }))
}
