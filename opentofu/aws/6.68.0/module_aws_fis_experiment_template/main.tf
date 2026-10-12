resource "aws_fis_experiment_template" "fis_experiment_templates" {
  for_each = var.fis_experiment_templates

  description = each.value.description
  role_arn    = each.value.role_arn
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {
      action_id   = action.value.action_id
      name        = action.value.name
      description = action.value.description
      start_after = action.value.start_after

      dynamic "parameter" {
        for_each = action.value.parameter != null ? action.value.parameter : []
        content {
          key   = parameter.value.key
          value = parameter.value.value
        }
      }

      dynamic "target" {
        for_each = action.value.target != null ? action.value.target : []
        content {
          key   = target.value.key
          value = target.value.value
        }
      }
    }
  }

  dynamic "experiment_options" {
    for_each = each.value.experiment_options != null ? each.value.experiment_options : []
    content {
      account_targeting            = experiment_options.value.account_targeting
      empty_target_resolution_mode = experiment_options.value.empty_target_resolution_mode
    }
  }

  dynamic "experiment_report_configuration" {
    for_each = each.value.experiment_report_configuration != null ? each.value.experiment_report_configuration : []
    content {
      post_experiment_duration = experiment_report_configuration.value.post_experiment_duration
      pre_experiment_duration  = experiment_report_configuration.value.pre_experiment_duration

      dynamic "data_sources" {
        for_each = experiment_report_configuration.value.data_sources != null ? experiment_report_configuration.value.data_sources : []
        content {

          dynamic "cloudwatch_dashboard" {
            for_each = data_sources.value.cloudwatch_dashboard != null ? data_sources.value.cloudwatch_dashboard : []
            content {
              dashboard_arn = cloudwatch_dashboard.value.dashboard_arn
            }
          }
        }
      }

      dynamic "outputs" {
        for_each = experiment_report_configuration.value.outputs != null ? experiment_report_configuration.value.outputs : []
        content {

          dynamic "s3_configuration" {
            for_each = outputs.value.s3_configuration != null ? outputs.value.s3_configuration : []
            content {
              bucket_name = s3_configuration.value.bucket_name
              prefix      = s3_configuration.value.prefix
            }
          }
        }
      }
    }
  }

  dynamic "log_configuration" {
    for_each = each.value.log_configuration != null ? each.value.log_configuration : []
    content {
      log_schema_version = log_configuration.value.log_schema_version

      dynamic "cloudwatch_logs_configuration" {
        for_each = log_configuration.value.cloudwatch_logs_configuration != null ? log_configuration.value.cloudwatch_logs_configuration : []
        content {
          log_group_arn = cloudwatch_logs_configuration.value.log_group_arn
        }
      }

      dynamic "s3_configuration" {
        for_each = log_configuration.value.s3_configuration != null ? log_configuration.value.s3_configuration : []
        content {
          bucket_name = s3_configuration.value.bucket_name
          prefix      = s3_configuration.value.prefix
        }
      }
    }
  }

  dynamic "stop_condition" {
    for_each = each.value.stop_condition != null ? each.value.stop_condition : []
    content {
      source = stop_condition.value.source
      value  = stop_condition.value.value
    }
  }

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      name           = target.value.name
      resource_type  = target.value.resource_type
      selection_mode = target.value.selection_mode
      parameters     = target.value.parameters
      resource_arns  = target.value.resource_arns

      dynamic "filter" {
        for_each = target.value.filter != null ? target.value.filter : []
        content {
          path   = filter.value.path
          values = filter.value.values
        }
      }

      dynamic "resource_tag" {
        for_each = target.value.resource_tag != null ? target.value.resource_tag : []
        content {
          key   = resource_tag.value.key
          value = resource_tag.value.value
        }
      }
    }
  }
}
