resource "aws_dynamodb_table_replica" "dynamodb_table_replicas" {
  for_each = var.dynamodb_table_replicas

  global_table_arn            = each.value.global_table_arn
  deletion_protection_enabled = each.value.deletion_protection_enabled
  kms_key_arn                 = each.value.kms_key_arn
  point_in_time_recovery      = each.value.point_in_time_recovery
  region                      = each.value.region
  table_class_override        = each.value.table_class_override
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
