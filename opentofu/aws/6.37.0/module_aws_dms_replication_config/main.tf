resource "aws_dms_replication_config" "dms_replication_configs" {
  for_each = var.dms_replication_configs

  replication_config_identifier = each.value.replication_config_identifier
  replication_type              = each.value.replication_type
  source_endpoint_arn           = each.value.source_endpoint_arn
  table_mappings                = each.value.table_mappings
  target_endpoint_arn           = each.value.target_endpoint_arn
  region                        = each.value.region
  replication_settings          = each.value.replication_settings
  resource_identifier           = each.value.resource_identifier
  start_replication             = each.value.start_replication
  supplemental_settings         = each.value.supplemental_settings
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all

  dynamic "compute_config" {
    for_each = each.value.compute_config != null ? each.value.compute_config : []
    content {
      replication_subnet_group_id  = compute_config.value.replication_subnet_group_id
      availability_zone            = compute_config.value.availability_zone
      dns_name_servers             = compute_config.value.dns_name_servers
      kms_key_id                   = compute_config.value.kms_key_id
      max_capacity_units           = compute_config.value.max_capacity_units
      min_capacity_units           = compute_config.value.min_capacity_units
      multi_az                     = compute_config.value.multi_az
      preferred_maintenance_window = compute_config.value.preferred_maintenance_window
      vpc_security_group_ids       = compute_config.value.vpc_security_group_ids
    }
  }
}
