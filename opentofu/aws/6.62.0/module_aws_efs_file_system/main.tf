resource "aws_efs_file_system" "efs_file_systems" {
  for_each = var.efs_file_systems

  availability_zone_name          = each.value.availability_zone_name
  creation_token                  = each.value.creation_token
  encrypted                       = each.value.encrypted
  kms_key_id                      = each.value.kms_key_id
  performance_mode                = each.value.performance_mode
  provisioned_throughput_in_mibps = each.value.provisioned_throughput_in_mibps
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  throughput_mode                 = each.value.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = each.value.lifecycle_policy != null ? each.value.lifecycle_policy : []
    content {
      transition_to_archive               = lifecycle_policy.value.transition_to_archive
      transition_to_ia                    = lifecycle_policy.value.transition_to_ia
      transition_to_primary_storage_class = lifecycle_policy.value.transition_to_primary_storage_class
    }
  }

  dynamic "protection" {
    for_each = each.value.protection != null ? each.value.protection : []
    content {
      replication_overwrite = protection.value.replication_overwrite
    }
  }
}
