resource "aws_securityhub_automation_rule_v2" "securityhub_automation_rule_v2s" {
  for_each = var.securityhub_automation_rule_v2s

  description = each.value.description
  rule_name   = each.value.rule_name
  rule_order  = each.value.rule_order
  region      = each.value.region
  rule_status = each.value.rule_status
  tags        = each.value.tags

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {
      type = action.value.type

      dynamic "external_integration_configuration" {
        for_each = action.value.external_integration_configuration != null ? action.value.external_integration_configuration : []
        content {
          connector_arn = external_integration_configuration.value.connector_arn
        }
      }

      dynamic "finding_fields_update" {
        for_each = action.value.finding_fields_update != null ? action.value.finding_fields_update : []
        content {
          comment     = finding_fields_update.value.comment
          severity_id = finding_fields_update.value.severity_id
          status_id   = finding_fields_update.value.status_id
        }
      }
    }
  }

  dynamic "criteria" {
    for_each = each.value.criteria != null ? each.value.criteria : []
    content {
      ocsf_finding_criteria_json = criteria.value.ocsf_finding_criteria_json
    }
  }
}
