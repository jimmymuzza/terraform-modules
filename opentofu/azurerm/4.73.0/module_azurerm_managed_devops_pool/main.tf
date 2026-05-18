resource "azurerm_managed_devops_pool" "managed_devops_pools" {
  for_each = var.managed_devops_pools

  dev_center_project_id = each.value.dev_center_project_id
  location              = each.value.location
  maximum_concurrency   = each.value.maximum_concurrency
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  tags                  = each.value.tags
  work_folder           = each.value.work_folder

  dynamic "azure_devops_organization" {
    for_each = each.value.azure_devops_organization != null ? each.value.azure_devops_organization : []
    content {

      dynamic "organization" {
        for_each = azure_devops_organization.value.organization != null ? azure_devops_organization.value.organization : []
        content {
          parallelism = organization.value.parallelism
          url         = organization.value.url
          projects    = organization.value.projects
        }
      }

      dynamic "permission" {
        for_each = azure_devops_organization.value.permission != null ? azure_devops_organization.value.permission : []
        content {
          kind = permission.value.kind

          dynamic "administrator_account" {
            for_each = permission.value.administrator_account != null ? permission.value.administrator_account : []
            content {
              groups = administrator_account.value.groups
              users  = administrator_account.value.users
            }
          }
        }
      }
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "stateful_agent" {
    for_each = each.value.stateful_agent != null ? each.value.stateful_agent : []
    content {
      grace_period_time_span = stateful_agent.value.grace_period_time_span
      maximum_agent_lifetime = stateful_agent.value.maximum_agent_lifetime

      dynamic "automatic_resource_prediction" {
        for_each = stateful_agent.value.automatic_resource_prediction != null ? stateful_agent.value.automatic_resource_prediction : []
        content {
          prediction_preference = automatic_resource_prediction.value.prediction_preference
        }
      }

      dynamic "manual_resource_prediction" {
        for_each = stateful_agent.value.manual_resource_prediction != null ? stateful_agent.value.manual_resource_prediction : []
        content {
          all_week_schedule = manual_resource_prediction.value.all_week_schedule
          time_zone_name    = manual_resource_prediction.value.time_zone_name

          dynamic "friday_schedule" {
            for_each = manual_resource_prediction.value.friday_schedule != null ? manual_resource_prediction.value.friday_schedule : []
            content {
              count = friday_schedule.value.count
              time  = friday_schedule.value.time
            }
          }

          dynamic "monday_schedule" {
            for_each = manual_resource_prediction.value.monday_schedule != null ? manual_resource_prediction.value.monday_schedule : []
            content {
              count = monday_schedule.value.count
              time  = monday_schedule.value.time
            }
          }

          dynamic "saturday_schedule" {
            for_each = manual_resource_prediction.value.saturday_schedule != null ? manual_resource_prediction.value.saturday_schedule : []
            content {
              count = saturday_schedule.value.count
              time  = saturday_schedule.value.time
            }
          }

          dynamic "sunday_schedule" {
            for_each = manual_resource_prediction.value.sunday_schedule != null ? manual_resource_prediction.value.sunday_schedule : []
            content {
              count = sunday_schedule.value.count
              time  = sunday_schedule.value.time
            }
          }

          dynamic "thursday_schedule" {
            for_each = manual_resource_prediction.value.thursday_schedule != null ? manual_resource_prediction.value.thursday_schedule : []
            content {
              count = thursday_schedule.value.count
              time  = thursday_schedule.value.time
            }
          }

          dynamic "tuesday_schedule" {
            for_each = manual_resource_prediction.value.tuesday_schedule != null ? manual_resource_prediction.value.tuesday_schedule : []
            content {
              count = tuesday_schedule.value.count
              time  = tuesday_schedule.value.time
            }
          }

          dynamic "wednesday_schedule" {
            for_each = manual_resource_prediction.value.wednesday_schedule != null ? manual_resource_prediction.value.wednesday_schedule : []
            content {
              count = wednesday_schedule.value.count
              time  = wednesday_schedule.value.time
            }
          }
        }
      }
    }
  }

  dynamic "stateless_agent" {
    for_each = each.value.stateless_agent != null ? each.value.stateless_agent : []
    content {

      dynamic "automatic_resource_prediction" {
        for_each = stateless_agent.value.automatic_resource_prediction != null ? stateless_agent.value.automatic_resource_prediction : []
        content {
          prediction_preference = automatic_resource_prediction.value.prediction_preference
        }
      }

      dynamic "manual_resource_prediction" {
        for_each = stateless_agent.value.manual_resource_prediction != null ? stateless_agent.value.manual_resource_prediction : []
        content {
          all_week_schedule = manual_resource_prediction.value.all_week_schedule
          time_zone_name    = manual_resource_prediction.value.time_zone_name

          dynamic "friday_schedule" {
            for_each = manual_resource_prediction.value.friday_schedule != null ? manual_resource_prediction.value.friday_schedule : []
            content {
              count = friday_schedule.value.count
              time  = friday_schedule.value.time
            }
          }

          dynamic "monday_schedule" {
            for_each = manual_resource_prediction.value.monday_schedule != null ? manual_resource_prediction.value.monday_schedule : []
            content {
              count = monday_schedule.value.count
              time  = monday_schedule.value.time
            }
          }

          dynamic "saturday_schedule" {
            for_each = manual_resource_prediction.value.saturday_schedule != null ? manual_resource_prediction.value.saturday_schedule : []
            content {
              count = saturday_schedule.value.count
              time  = saturday_schedule.value.time
            }
          }

          dynamic "sunday_schedule" {
            for_each = manual_resource_prediction.value.sunday_schedule != null ? manual_resource_prediction.value.sunday_schedule : []
            content {
              count = sunday_schedule.value.count
              time  = sunday_schedule.value.time
            }
          }

          dynamic "thursday_schedule" {
            for_each = manual_resource_prediction.value.thursday_schedule != null ? manual_resource_prediction.value.thursday_schedule : []
            content {
              count = thursday_schedule.value.count
              time  = thursday_schedule.value.time
            }
          }

          dynamic "tuesday_schedule" {
            for_each = manual_resource_prediction.value.tuesday_schedule != null ? manual_resource_prediction.value.tuesday_schedule : []
            content {
              count = tuesday_schedule.value.count
              time  = tuesday_schedule.value.time
            }
          }

          dynamic "wednesday_schedule" {
            for_each = manual_resource_prediction.value.wednesday_schedule != null ? manual_resource_prediction.value.wednesday_schedule : []
            content {
              count = wednesday_schedule.value.count
              time  = wednesday_schedule.value.time
            }
          }
        }
      }
    }
  }

  dynamic "virtual_machine_scale_set_fabric" {
    for_each = each.value.virtual_machine_scale_set_fabric != null ? each.value.virtual_machine_scale_set_fabric : []
    content {
      sku_name                     = virtual_machine_scale_set_fabric.value.sku_name
      os_disk_storage_account_type = virtual_machine_scale_set_fabric.value.os_disk_storage_account_type
      subnet_id                    = virtual_machine_scale_set_fabric.value.subnet_id

      dynamic "image" {
        for_each = virtual_machine_scale_set_fabric.value.image != null ? virtual_machine_scale_set_fabric.value.image : []
        content {
          aliases               = image.value.aliases
          buffer                = image.value.buffer
          well_known_image_name = image.value.well_known_image_name
        }
      }

      dynamic "security" {
        for_each = virtual_machine_scale_set_fabric.value.security != null ? virtual_machine_scale_set_fabric.value.security : []
        content {
          interactive_logon_enabled = security.value.interactive_logon_enabled

          dynamic "key_vault_management" {
            for_each = security.value.key_vault_management != null ? security.value.key_vault_management : []
            content {
              key_vault_certificate_ids  = key_vault_management.value.key_vault_certificate_ids
              certificate_store_location = key_vault_management.value.certificate_store_location
              certificate_store_name     = key_vault_management.value.certificate_store_name
              key_export_enabled         = key_vault_management.value.key_export_enabled
            }
          }
        }
      }

      dynamic "storage" {
        for_each = virtual_machine_scale_set_fabric.value.storage != null ? virtual_machine_scale_set_fabric.value.storage : []
        content {
          disk_size_in_gb      = storage.value.disk_size_in_gb
          caching              = storage.value.caching
          drive_letter         = storage.value.drive_letter
          storage_account_type = storage.value.storage_account_type
        }
      }
    }
  }
}
