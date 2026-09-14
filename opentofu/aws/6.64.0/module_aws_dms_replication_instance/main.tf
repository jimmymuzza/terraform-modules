resource "aws_dms_replication_instance" "dms_replication_instances" {
  for_each = var.dms_replication_instances

  replication_instance_class   = each.value.replication_instance_class
  replication_instance_id      = each.value.replication_instance_id
  allocated_storage            = each.value.allocated_storage
  allow_major_version_upgrade  = each.value.allow_major_version_upgrade
  apply_immediately            = each.value.apply_immediately
  auto_minor_version_upgrade   = each.value.auto_minor_version_upgrade
  availability_zone            = each.value.availability_zone
  dns_name_servers             = each.value.dns_name_servers
  engine_version               = each.value.engine_version
  kms_key_arn                  = each.value.kms_key_arn
  multi_az                     = each.value.multi_az
  network_type                 = each.value.network_type
  preferred_maintenance_window = each.value.preferred_maintenance_window
  publicly_accessible          = each.value.publicly_accessible
  region                       = each.value.region
  replication_subnet_group_id  = each.value.replication_subnet_group_id
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
  vpc_security_group_ids       = each.value.vpc_security_group_ids

  dynamic "kerberos_authentication_settings" {
    for_each = each.value.kerberos_authentication_settings != null ? each.value.kerberos_authentication_settings : []
    content {
      key_cache_secret_iam_arn = kerberos_authentication_settings.value.key_cache_secret_iam_arn
      key_cache_secret_id      = kerberos_authentication_settings.value.key_cache_secret_id
      krb5_file_contents       = kerberos_authentication_settings.value.krb5_file_contents
    }
  }
}
