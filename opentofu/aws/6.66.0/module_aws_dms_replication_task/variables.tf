variable "dms_replication_tasks" {
  description = <<EOT
Map of dms_replication_tasks, attributes below
Required:
    - migration_type
    - replication_instance_arn
    - replication_task_id
    - source_endpoint_arn
    - table_mappings
    - target_endpoint_arn
Optional:
    - cdc_start_position
    - cdc_start_time
    - region
    - replication_task_settings
    - resource_identifier
    - start_replication_task
    - tags
    - tags_all
EOT

  type = map(object({
    migration_type            = string
    replication_instance_arn  = string
    replication_task_id       = string
    source_endpoint_arn       = string
    table_mappings            = string
    target_endpoint_arn       = string
    cdc_start_position        = optional(string)
    cdc_start_time            = optional(string)
    region                    = optional(string)
    replication_task_settings = optional(string)
    resource_identifier       = optional(string)
    start_replication_task    = optional(bool)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
  }))
}
