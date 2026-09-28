variable "site_recovery_replication_recovery_plans" {
  description = <<EOT
Map of site_recovery_replication_recovery_plans, attributes below
Required:
    - name
    - recovery_vault_id
    - source_recovery_fabric_id
    - target_recovery_fabric_id
    - boot_recovery_group
    - failover_recovery_group
    - shutdown_recovery_group
Optional:
    - azure_to_azure_settings
EOT

  type = map(object({
    name                      = string
    recovery_vault_id         = string
    source_recovery_fabric_id = string
    target_recovery_fabric_id = string
    azure_to_azure_settings   = optional(list(object({
            primary_edge_zone  = optional(string)
            primary_zone       = optional(string)
            recovery_edge_zone = optional(string)
            recovery_zone      = optional(string)
        })))
    boot_recovery_group       = list(object({
            replicated_protected_items = optional(list(string))
            post_action                = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
            pre_action                 = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
        }))
    failover_recovery_group   = list(object({
            post_action = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
            pre_action  = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
        }))
    shutdown_recovery_group   = list(object({
            post_action = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
            pre_action  = optional(list(object({
                fail_over_directions      = set(string)
                fail_over_types           = set(string)
                name                      = string
                type                      = string
                fabric_location           = optional(string)
                manual_action_instruction = optional(string)
                runbook_id                = optional(string)
                script_path               = optional(string)
            })))
        }))
  }))
}
