resource "aws_datasync_task" "datasync_tasks" {
  for_each = var.datasync_tasks

  destination_location_arn = each.value.destination_location_arn
  source_location_arn      = each.value.source_location_arn
  cloudwatch_log_group_arn = each.value.cloudwatch_log_group_arn
  name                     = each.value.name
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  task_mode                = each.value.task_mode

  dynamic "excludes" {
    for_each = each.value.excludes != null ? each.value.excludes : []
    content {
      filter_type = excludes.value.filter_type
      value       = excludes.value.value
    }
  }

  dynamic "includes" {
    for_each = each.value.includes != null ? each.value.includes : []
    content {
      filter_type = includes.value.filter_type
      value       = includes.value.value
    }
  }

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      atime                          = options.value.atime
      bytes_per_second               = options.value.bytes_per_second
      gid                            = options.value.gid
      log_level                      = options.value.log_level
      mtime                          = options.value.mtime
      object_tags                    = options.value.object_tags
      overwrite_mode                 = options.value.overwrite_mode
      posix_permissions              = options.value.posix_permissions
      preserve_deleted_files         = options.value.preserve_deleted_files
      preserve_devices               = options.value.preserve_devices
      security_descriptor_copy_flags = options.value.security_descriptor_copy_flags
      task_queueing                  = options.value.task_queueing
      transfer_mode                  = options.value.transfer_mode
      uid                            = options.value.uid
      verify_mode                    = options.value.verify_mode
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      schedule_expression = schedule.value.schedule_expression
      status              = schedule.value.status
    }
  }

  dynamic "task_report_config" {
    for_each = each.value.task_report_config != null ? each.value.task_report_config : []
    content {
      output_type          = task_report_config.value.output_type
      report_level         = task_report_config.value.report_level
      s3_object_versioning = task_report_config.value.s3_object_versioning

      dynamic "report_overrides" {
        for_each = task_report_config.value.report_overrides != null ? task_report_config.value.report_overrides : []
        content {
          deleted_override     = report_overrides.value.deleted_override
          skipped_override     = report_overrides.value.skipped_override
          transferred_override = report_overrides.value.transferred_override
          verified_override    = report_overrides.value.verified_override
        }
      }

      dynamic "s3_destination" {
        for_each = task_report_config.value.s3_destination != null ? task_report_config.value.s3_destination : []
        content {
          bucket_access_role_arn = s3_destination.value.bucket_access_role_arn
          s3_bucket_arn          = s3_destination.value.s3_bucket_arn
          subdirectory           = s3_destination.value.subdirectory
        }
      }
    }
  }
}
