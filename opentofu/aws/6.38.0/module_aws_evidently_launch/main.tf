resource "aws_evidently_launch" "evidently_launches" {
  for_each = var.evidently_launches

  name               = each.value.name
  project            = each.value.project
  description        = each.value.description
  randomization_salt = each.value.randomization_salt
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "groups" {
    for_each = each.value.groups != null ? each.value.groups : []
    content {
      feature     = groups.value.feature
      name        = groups.value.name
      variation   = groups.value.variation
      description = groups.value.description
    }
  }

  dynamic "metric_monitors" {
    for_each = each.value.metric_monitors != null ? each.value.metric_monitors : []
    content {

      dynamic "metric_definition" {
        for_each = metric_monitors.value.metric_definition != null ? metric_monitors.value.metric_definition : []
        content {
          entity_id_key = metric_definition.value.entity_id_key
          name          = metric_definition.value.name
          value_key     = metric_definition.value.value_key
          event_pattern = metric_definition.value.event_pattern
          unit_label    = metric_definition.value.unit_label
        }
      }
    }
  }

  dynamic "scheduled_splits_config" {
    for_each = each.value.scheduled_splits_config != null ? each.value.scheduled_splits_config : []
    content {

      dynamic "steps" {
        for_each = scheduled_splits_config.value.steps != null ? scheduled_splits_config.value.steps : []
        content {
          group_weights = steps.value.group_weights
          start_time    = steps.value.start_time

          dynamic "segment_overrides" {
            for_each = steps.value.segment_overrides != null ? steps.value.segment_overrides : []
            content {
              evaluation_order = segment_overrides.value.evaluation_order
              segment          = segment_overrides.value.segment
              weights          = segment_overrides.value.weights
            }
          }
        }
      }
    }
  }
}
