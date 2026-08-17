resource "aws_inspector_assessment_template" "inspector_assessment_templates" {
  for_each = var.inspector_assessment_templates

  duration           = each.value.duration
  name               = each.value.name
  rules_package_arns = each.value.rules_package_arns
  target_arn         = each.value.target_arn
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "event_subscription" {
    for_each = each.value.event_subscription != null ? each.value.event_subscription : []
    content {
      event     = event_subscription.value.event
      topic_arn = event_subscription.value.topic_arn
    }
  }
}
