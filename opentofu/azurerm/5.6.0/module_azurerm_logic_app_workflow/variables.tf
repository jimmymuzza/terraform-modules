variable "logic_app_workflows" {
  description = <<EOT
Map of logic_app_workflows, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - enabled
    - integration_service_environment_id
    - logic_app_integration_account_id
    - parameters
    - tags
    - workflow_parameters
    - workflow_schema
    - workflow_version
    - access_control
    - identity
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    enabled                            = optional(bool)
    integration_service_environment_id = optional(string)
    logic_app_integration_account_id   = optional(string)
    parameters                         = optional(map(string))
    tags                               = optional(map(string))
    workflow_parameters                = optional(map(string))
    workflow_schema                    = optional(string)
    workflow_version                   = optional(string)
    access_control                     = optional(list(object({
            action              = optional(list(object({
                allowed_caller_ip_address_range = set(string)
            })))
            content             = optional(list(object({
                allowed_caller_ip_address_range = set(string)
            })))
            trigger             = optional(list(object({
                allowed_caller_ip_address_range = optional(set(string))
                open_authentication_policy      = optional(set(object({
                    name  = string
                    claim = set(object({
                        name  = string
                        value = string
                    }))
                })))
            })))
            workflow_management = optional(list(object({
                allowed_caller_ip_address_range = set(string)
            })))
        })))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
