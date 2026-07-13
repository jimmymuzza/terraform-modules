resource "azurerm_site_recovery_replication_recovery_plan" "site_recovery_replication_recovery_plans" {
  for_each = var.site_recovery_replication_recovery_plans

  name                      = each.value.name
  recovery_vault_id         = each.value.recovery_vault_id
  source_recovery_fabric_id = each.value.source_recovery_fabric_id
  target_recovery_fabric_id = each.value.target_recovery_fabric_id

  dynamic "azure_to_azure_settings" {
    for_each = each.value.azure_to_azure_settings != null ? each.value.azure_to_azure_settings : []
    content {
      primary_edge_zone  = azure_to_azure_settings.value.primary_edge_zone
      primary_zone       = azure_to_azure_settings.value.primary_zone
      recovery_edge_zone = azure_to_azure_settings.value.recovery_edge_zone
      recovery_zone      = azure_to_azure_settings.value.recovery_zone
    }
  }

  dynamic "boot_recovery_group" {
    for_each = each.value.boot_recovery_group != null ? each.value.boot_recovery_group : []
    content {
      replicated_protected_items = boot_recovery_group.value.replicated_protected_items

      dynamic "post_action" {
        for_each = boot_recovery_group.value.post_action != null ? boot_recovery_group.value.post_action : []
        content {
          fail_over_directions      = post_action.value.fail_over_directions
          fail_over_types           = post_action.value.fail_over_types
          name                      = post_action.value.name
          type                      = post_action.value.type
          fabric_location           = post_action.value.fabric_location
          manual_action_instruction = post_action.value.manual_action_instruction
          runbook_id                = post_action.value.runbook_id
          script_path               = post_action.value.script_path
        }
      }

      dynamic "pre_action" {
        for_each = boot_recovery_group.value.pre_action != null ? boot_recovery_group.value.pre_action : []
        content {
          fail_over_directions      = pre_action.value.fail_over_directions
          fail_over_types           = pre_action.value.fail_over_types
          name                      = pre_action.value.name
          type                      = pre_action.value.type
          fabric_location           = pre_action.value.fabric_location
          manual_action_instruction = pre_action.value.manual_action_instruction
          runbook_id                = pre_action.value.runbook_id
          script_path               = pre_action.value.script_path
        }
      }
    }
  }

  dynamic "failover_recovery_group" {
    for_each = each.value.failover_recovery_group != null ? each.value.failover_recovery_group : []
    content {

      dynamic "post_action" {
        for_each = failover_recovery_group.value.post_action != null ? failover_recovery_group.value.post_action : []
        content {
          fail_over_directions      = post_action.value.fail_over_directions
          fail_over_types           = post_action.value.fail_over_types
          name                      = post_action.value.name
          type                      = post_action.value.type
          fabric_location           = post_action.value.fabric_location
          manual_action_instruction = post_action.value.manual_action_instruction
          runbook_id                = post_action.value.runbook_id
          script_path               = post_action.value.script_path
        }
      }

      dynamic "pre_action" {
        for_each = failover_recovery_group.value.pre_action != null ? failover_recovery_group.value.pre_action : []
        content {
          fail_over_directions      = pre_action.value.fail_over_directions
          fail_over_types           = pre_action.value.fail_over_types
          name                      = pre_action.value.name
          type                      = pre_action.value.type
          fabric_location           = pre_action.value.fabric_location
          manual_action_instruction = pre_action.value.manual_action_instruction
          runbook_id                = pre_action.value.runbook_id
          script_path               = pre_action.value.script_path
        }
      }
    }
  }

  dynamic "shutdown_recovery_group" {
    for_each = each.value.shutdown_recovery_group != null ? each.value.shutdown_recovery_group : []
    content {

      dynamic "post_action" {
        for_each = shutdown_recovery_group.value.post_action != null ? shutdown_recovery_group.value.post_action : []
        content {
          fail_over_directions      = post_action.value.fail_over_directions
          fail_over_types           = post_action.value.fail_over_types
          name                      = post_action.value.name
          type                      = post_action.value.type
          fabric_location           = post_action.value.fabric_location
          manual_action_instruction = post_action.value.manual_action_instruction
          runbook_id                = post_action.value.runbook_id
          script_path               = post_action.value.script_path
        }
      }

      dynamic "pre_action" {
        for_each = shutdown_recovery_group.value.pre_action != null ? shutdown_recovery_group.value.pre_action : []
        content {
          fail_over_directions      = pre_action.value.fail_over_directions
          fail_over_types           = pre_action.value.fail_over_types
          name                      = pre_action.value.name
          type                      = pre_action.value.type
          fabric_location           = pre_action.value.fabric_location
          manual_action_instruction = pre_action.value.manual_action_instruction
          runbook_id                = pre_action.value.runbook_id
          script_path               = pre_action.value.script_path
        }
      }
    }
  }
}
