resource "aws_m2_environment" "m2_environments" {
  for_each = var.m2_environments

  engine_type                             = each.value.engine_type
  instance_type                           = each.value.instance_type
  name                                    = each.value.name
  apply_changes_during_maintenance_window = each.value.apply_changes_during_maintenance_window
  description                             = each.value.description
  engine_version                          = each.value.engine_version
  force_update                            = each.value.force_update
  kms_key_id                              = each.value.kms_key_id
  preferred_maintenance_window            = each.value.preferred_maintenance_window
  publicly_accessible                     = each.value.publicly_accessible
  region                                  = each.value.region
  security_group_ids                      = each.value.security_group_ids
  subnet_ids                              = each.value.subnet_ids
  tags                                    = each.value.tags

  dynamic "high_availability_config" {
    for_each = each.value.high_availability_config != null ? each.value.high_availability_config : []
    content {
      desired_capacity = high_availability_config.value.desired_capacity
    }
  }

  dynamic "storage_configuration" {
    for_each = each.value.storage_configuration != null ? each.value.storage_configuration : []
    content {

      dynamic "efs" {
        for_each = storage_configuration.value.efs != null ? storage_configuration.value.efs : []
        content {
          file_system_id = efs.value.file_system_id
          mount_point    = efs.value.mount_point
        }
      }

      dynamic "fsx" {
        for_each = storage_configuration.value.fsx != null ? storage_configuration.value.fsx : []
        content {
          file_system_id = fsx.value.file_system_id
          mount_point    = fsx.value.mount_point
        }
      }
    }
  }
}
