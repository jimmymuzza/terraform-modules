resource "aws_cloudwatch_event_bus" "cloudwatch_event_bus" {
  for_each = var.cloudwatch_event_bus

  name               = each.value.name
  description        = each.value.description
  event_source_name  = each.value.event_source_name
  kms_key_identifier = each.value.kms_key_identifier
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "dead_letter_config" {
    for_each = each.value.dead_letter_config != null ? each.value.dead_letter_config : []
    content {
      arn = dead_letter_config.value.arn
    }
  }

  dynamic "log_config" {
    for_each = each.value.log_config != null ? each.value.log_config : []
    content {
      include_detail = log_config.value.include_detail
      level          = log_config.value.level
    }
  }
}
