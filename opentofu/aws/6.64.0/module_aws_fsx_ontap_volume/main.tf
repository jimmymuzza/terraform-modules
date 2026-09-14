resource "aws_fsx_ontap_volume" "fsx_ontap_volumes" {
  for_each = var.fsx_ontap_volumes

  name                                 = each.value.name
  storage_virtual_machine_id           = each.value.storage_virtual_machine_id
  bypass_snaplock_enterprise_retention = each.value.bypass_snaplock_enterprise_retention
  copy_tags_to_backups                 = each.value.copy_tags_to_backups
  final_backup_tags                    = each.value.final_backup_tags
  junction_path                        = each.value.junction_path
  ontap_volume_type                    = each.value.ontap_volume_type
  region                               = each.value.region
  security_style                       = each.value.security_style
  size_in_bytes                        = each.value.size_in_bytes
  size_in_megabytes                    = each.value.size_in_megabytes
  skip_final_backup                    = each.value.skip_final_backup
  snapshot_policy                      = each.value.snapshot_policy
  storage_efficiency_enabled           = each.value.storage_efficiency_enabled
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
  volume_style                         = each.value.volume_style
  volume_type                          = each.value.volume_type

  dynamic "aggregate_configuration" {
    for_each = each.value.aggregate_configuration != null ? each.value.aggregate_configuration : []
    content {
      aggregates                 = aggregate_configuration.value.aggregates
      constituents_per_aggregate = aggregate_configuration.value.constituents_per_aggregate
    }
  }

  dynamic "snaplock_configuration" {
    for_each = each.value.snaplock_configuration != null ? each.value.snaplock_configuration : []
    content {
      snaplock_type              = snaplock_configuration.value.snaplock_type
      audit_log_volume           = snaplock_configuration.value.audit_log_volume
      privileged_delete          = snaplock_configuration.value.privileged_delete
      volume_append_mode_enabled = snaplock_configuration.value.volume_append_mode_enabled

      dynamic "autocommit_period" {
        for_each = snaplock_configuration.value.autocommit_period != null ? snaplock_configuration.value.autocommit_period : []
        content {
          type  = autocommit_period.value.type
          value = autocommit_period.value.value
        }
      }

      dynamic "retention_period" {
        for_each = snaplock_configuration.value.retention_period != null ? snaplock_configuration.value.retention_period : []
        content {

          dynamic "default_retention" {
            for_each = retention_period.value.default_retention != null ? retention_period.value.default_retention : []
            content {
              type  = default_retention.value.type
              value = default_retention.value.value
            }
          }

          dynamic "maximum_retention" {
            for_each = retention_period.value.maximum_retention != null ? retention_period.value.maximum_retention : []
            content {
              type  = maximum_retention.value.type
              value = maximum_retention.value.value
            }
          }

          dynamic "minimum_retention" {
            for_each = retention_period.value.minimum_retention != null ? retention_period.value.minimum_retention : []
            content {
              type  = minimum_retention.value.type
              value = minimum_retention.value.value
            }
          }
        }
      }
    }
  }

  dynamic "tiering_policy" {
    for_each = each.value.tiering_policy != null ? each.value.tiering_policy : []
    content {
      cooling_period = tiering_policy.value.cooling_period
      name           = tiering_policy.value.name
    }
  }
}
