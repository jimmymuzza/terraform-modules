resource "aws_dms_replication_task" "dms_replication_tasks" {
  for_each = var.dms_replication_tasks

  migration_type            = each.value.migration_type
  replication_instance_arn  = each.value.replication_instance_arn
  replication_task_id       = each.value.replication_task_id
  source_endpoint_arn       = each.value.source_endpoint_arn
  table_mappings            = each.value.table_mappings
  target_endpoint_arn       = each.value.target_endpoint_arn
  cdc_start_position        = each.value.cdc_start_position
  cdc_start_time            = each.value.cdc_start_time
  region                    = each.value.region
  replication_task_settings = each.value.replication_task_settings
  resource_identifier       = each.value.resource_identifier
  start_replication_task    = each.value.start_replication_task
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
}
