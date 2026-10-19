resource "aws_appconfig_environment" "appconfig_environments" {
  for_each = var.appconfig_environments

  application_id = each.value.application_id
  name           = each.value.name
  description    = each.value.description
  region         = each.value.region
  tags           = each.value.tags

  dynamic "monitor" {
    for_each = each.value.monitor != null ? each.value.monitor : []
    content {
      alarm_arn      = monitor.value.alarm_arn
      alarm_role_arn = monitor.value.alarm_role_arn
    }
  }
}
