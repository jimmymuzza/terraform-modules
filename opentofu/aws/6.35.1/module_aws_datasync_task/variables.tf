variable "datasync_tasks" {
  description = <<EOT
Map of datasync_tasks, attributes below
Required:
    - destination_location_arn
    - source_location_arn
Optional:
    - cloudwatch_log_group_arn
    - name
    - region
    - tags
    - tags_all
    - task_mode
    - excludes
    - includes
    - options
    - schedule
    - task_report_config
EOT

  type = map(object({
    destination_location_arn = string
    source_location_arn      = string
    cloudwatch_log_group_arn = optional(string)
    name                     = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    task_mode                = optional(string)
    excludes                 = optional(list(object({
            filter_type = optional(string)
            value       = optional(string)
        })))
    includes                 = optional(list(object({
            filter_type = optional(string)
            value       = optional(string)
        })))
    options                  = optional(list(object({
            atime                          = optional(string)
            bytes_per_second               = optional(number)
            gid                            = optional(string)
            log_level                      = optional(string)
            mtime                          = optional(string)
            object_tags                    = optional(string)
            overwrite_mode                 = optional(string)
            posix_permissions              = optional(string)
            preserve_deleted_files         = optional(string)
            preserve_devices               = optional(string)
            security_descriptor_copy_flags = optional(string)
            task_queueing                  = optional(string)
            transfer_mode                  = optional(string)
            uid                            = optional(string)
            verify_mode                    = optional(string)
        })))
    schedule                 = optional(list(object({
            schedule_expression = string
        })))
    task_report_config       = optional(list(object({
            output_type          = optional(string)
            report_level         = optional(string)
            s3_object_versioning = optional(string)
            report_overrides     = optional(list(object({
                deleted_override     = optional(string)
                skipped_override     = optional(string)
                transferred_override = optional(string)
                verified_override    = optional(string)
            })))
            s3_destination       = list(object({
                bucket_access_role_arn = string
                s3_bucket_arn          = string
                subdirectory           = optional(string)
            }))
        })))
  }))
}
