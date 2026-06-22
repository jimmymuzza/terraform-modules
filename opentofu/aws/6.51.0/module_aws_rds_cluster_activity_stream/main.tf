resource "aws_rds_cluster_activity_stream" "rds_cluster_activity_streams" {
  for_each = var.rds_cluster_activity_streams

  kms_key_id                          = each.value.kms_key_id
  mode                                = each.value.mode
  resource_arn                        = each.value.resource_arn
  engine_native_audit_fields_included = each.value.engine_native_audit_fields_included
  region                              = each.value.region
}
