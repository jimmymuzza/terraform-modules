resource "aws_ssmincidents_response_plan" "ssmincidents_response_plans" {
  for_each = var.ssmincidents_response_plans

  name         = each.value.name
  chat_channel = each.value.chat_channel
  display_name = each.value.display_name
  engagements  = each.value.engagements
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {

      dynamic "ssm_automation" {
        for_each = action.value.ssm_automation != null ? action.value.ssm_automation : []
        content {
          document_name      = ssm_automation.value.document_name
          role_arn           = ssm_automation.value.role_arn
          document_version   = ssm_automation.value.document_version
          dynamic_parameters = ssm_automation.value.dynamic_parameters
          target_account     = ssm_automation.value.target_account

          dynamic "parameter" {
            for_each = ssm_automation.value.parameter != null ? ssm_automation.value.parameter : []
            content {
              name   = parameter.value.name
              values = parameter.value.values
            }
          }
        }
      }
    }
  }

  dynamic "incident_template" {
    for_each = each.value.incident_template != null ? each.value.incident_template : []
    content {
      impact        = incident_template.value.impact
      title         = incident_template.value.title
      dedupe_string = incident_template.value.dedupe_string
      incident_tags = incident_template.value.incident_tags
      summary       = incident_template.value.summary

      dynamic "notification_target" {
        for_each = incident_template.value.notification_target != null ? incident_template.value.notification_target : []
        content {
          sns_topic_arn = notification_target.value.sns_topic_arn
        }
      }
    }
  }

  dynamic "integration" {
    for_each = each.value.integration != null ? each.value.integration : []
    content {

      dynamic "pagerduty" {
        for_each = integration.value.pagerduty != null ? integration.value.pagerduty : []
        content {
          name       = pagerduty.value.name
          secret_id  = pagerduty.value.secret_id
          service_id = pagerduty.value.service_id
        }
      }
    }
  }
}
