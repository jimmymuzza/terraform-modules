resource "aws_glue_trigger" "glue_triggers" {
  for_each = var.glue_triggers

  name              = each.value.name
  type              = each.value.type
  description       = each.value.description
  enabled           = each.value.enabled
  region            = each.value.region
  schedule          = each.value.schedule
  start_on_creation = each.value.start_on_creation
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  workflow_name     = each.value.workflow_name

  dynamic "actions" {
    for_each = each.value.actions != null ? each.value.actions : []
    content {
      arguments              = actions.value.arguments
      crawler_name           = actions.value.crawler_name
      job_name               = actions.value.job_name
      security_configuration = actions.value.security_configuration
      timeout                = actions.value.timeout

      dynamic "notification_property" {
        for_each = actions.value.notification_property != null ? actions.value.notification_property : []
        content {
          notify_delay_after = notification_property.value.notify_delay_after
        }
      }
    }
  }

  dynamic "event_batching_condition" {
    for_each = each.value.event_batching_condition != null ? each.value.event_batching_condition : []
    content {
      batch_size   = event_batching_condition.value.batch_size
      batch_window = event_batching_condition.value.batch_window
    }
  }

  dynamic "predicate" {
    for_each = each.value.predicate != null ? each.value.predicate : []
    content {
      logical = predicate.value.logical

      dynamic "conditions" {
        for_each = predicate.value.conditions != null ? predicate.value.conditions : []
        content {
          crawl_state      = conditions.value.crawl_state
          crawler_name     = conditions.value.crawler_name
          job_name         = conditions.value.job_name
          logical_operator = conditions.value.logical_operator
          state            = conditions.value.state
        }
      }
    }
  }
}
