resource "aws_efs_replication_configuration" "efs_replication_configurations" {
  for_each = var.efs_replication_configurations

  source_file_system_id = each.value.source_file_system_id
  region                = each.value.region

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {
      availability_zone_name = destination.value.availability_zone_name
      file_system_id         = destination.value.file_system_id
      kms_key_id             = destination.value.kms_key_id
      region                 = destination.value.region
    }
  }
}
