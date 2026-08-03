resource "aws_docdb_cluster_instance" "docdb_cluster_instances" {
  for_each = var.docdb_cluster_instances

  cluster_identifier              = each.value.cluster_identifier
  instance_class                  = each.value.instance_class
  apply_immediately               = each.value.apply_immediately
  auto_minor_version_upgrade      = each.value.auto_minor_version_upgrade
  availability_zone               = each.value.availability_zone
  ca_cert_identifier              = each.value.ca_cert_identifier
  certificate_rotation_restart    = each.value.certificate_rotation_restart
  copy_tags_to_snapshot           = each.value.copy_tags_to_snapshot
  enable_performance_insights     = each.value.enable_performance_insights
  engine                          = each.value.engine
  identifier                      = each.value.identifier
  identifier_prefix               = each.value.identifier_prefix
  performance_insights_kms_key_id = each.value.performance_insights_kms_key_id
  preferred_maintenance_window    = each.value.preferred_maintenance_window
  promotion_tier                  = each.value.promotion_tier
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
