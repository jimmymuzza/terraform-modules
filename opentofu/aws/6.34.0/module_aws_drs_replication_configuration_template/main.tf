resource "aws_drs_replication_configuration_template" "drs_replication_configuration_templates" {
  for_each = var.drs_replication_configuration_templates

  associate_default_security_group        = each.value.associate_default_security_group
  bandwidth_throttling                    = each.value.bandwidth_throttling
  create_public_ip                        = each.value.create_public_ip
  data_plane_routing                      = each.value.data_plane_routing
  default_large_staging_disk_type         = each.value.default_large_staging_disk_type
  ebs_encryption                          = each.value.ebs_encryption
  replication_server_instance_type        = each.value.replication_server_instance_type
  replication_servers_security_groups_ids = each.value.replication_servers_security_groups_ids
  staging_area_subnet_id                  = each.value.staging_area_subnet_id
  staging_area_tags                       = each.value.staging_area_tags
  use_dedicated_replication_server        = each.value.use_dedicated_replication_server
  auto_replicate_new_disks                = each.value.auto_replicate_new_disks
  ebs_encryption_key_arn                  = each.value.ebs_encryption_key_arn
  region                                  = each.value.region
  tags                                    = each.value.tags

  dynamic "pit_policy" {
    for_each = each.value.pit_policy != null ? each.value.pit_policy : []
    content {
      interval           = pit_policy.value.interval
      retention_duration = pit_policy.value.retention_duration
      units              = pit_policy.value.units
      enabled            = pit_policy.value.enabled
      rule_id            = pit_policy.value.rule_id
    }
  }
}
