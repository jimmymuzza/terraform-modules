variable "managed_devops_pools" {
  description = <<EOT
Map of managed_devops_pools, attributes below
Required:
    - dev_center_project_id
    - location
    - maximum_concurrency
    - name
    - resource_group_name
    - azure_devops_organization
    - virtual_machine_scale_set_fabric
Optional:
    - tags
    - work_folder
    - identity
    - stateful_agent
    - stateless_agent
EOT

  type = map(object({
    dev_center_project_id            = string
    location                         = string
    maximum_concurrency              = number
    name                             = string
    resource_group_name              = string
    tags                             = optional(map(string))
    work_folder                      = optional(string)
    azure_devops_organization        = list(object({
            organization = list(object({
                parallelism = number
                url         = string
                projects    = optional(list(string))
            }))
            permission   = optional(list(object({
                kind                  = string
                administrator_account = optional(list(object({
                    groups = optional(list(string))
                    users  = optional(list(string))
                })))
            })))
        }))
    identity                         = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    stateful_agent                   = optional(list(object({
            grace_period_time_span        = optional(string)
            maximum_agent_lifetime        = optional(string)
            automatic_resource_prediction = optional(list(object({
                prediction_preference = optional(string)
            })))
            manual_resource_prediction    = optional(list(object({
                all_week_schedule  = optional(number)
                time_zone_name     = optional(string)
                friday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                monday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                saturday_schedule  = optional(set(object({
                    count = number
                    time  = string
                })))
                sunday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                thursday_schedule  = optional(set(object({
                    count = number
                    time  = string
                })))
                tuesday_schedule   = optional(set(object({
                    count = number
                    time  = string
                })))
                wednesday_schedule = optional(set(object({
                    count = number
                    time  = string
                })))
            })))
        })))
    stateless_agent                  = optional(list(object({
            automatic_resource_prediction = optional(list(object({
                prediction_preference = optional(string)
            })))
            manual_resource_prediction    = optional(list(object({
                all_week_schedule  = optional(number)
                time_zone_name     = optional(string)
                friday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                monday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                saturday_schedule  = optional(set(object({
                    count = number
                    time  = string
                })))
                sunday_schedule    = optional(set(object({
                    count = number
                    time  = string
                })))
                thursday_schedule  = optional(set(object({
                    count = number
                    time  = string
                })))
                tuesday_schedule   = optional(set(object({
                    count = number
                    time  = string
                })))
                wednesday_schedule = optional(set(object({
                    count = number
                    time  = string
                })))
            })))
        })))
    virtual_machine_scale_set_fabric = list(object({
            sku_name                     = string
            os_disk_storage_account_type = optional(string)
            subnet_id                    = optional(string)
            image                        = list(object({
                aliases               = optional(list(string))
                buffer                = optional(string)
                well_known_image_name = optional(string)
            }))
            security                     = optional(list(object({
                interactive_logon_enabled = optional(bool)
                key_vault_management      = optional(list(object({
                    key_vault_certificate_ids  = list(string)
                    certificate_store_location = optional(string)
                    certificate_store_name     = optional(string)
                    key_export_enabled         = optional(bool)
                })))
            })))
            storage                      = optional(list(object({
                disk_size_in_gb      = number
                caching              = optional(string)
                drive_letter         = optional(string)
                storage_account_type = optional(string)
            })))
        }))
  }))
}
