resource "aws_securityhub_connector_v2" "securityhub_connector_v2s" {
  for_each = var.securityhub_connector_v2s

  name        = each.value.name
  description = each.value.description
  kms_key_arn = each.value.kms_key_arn
  region      = each.value.region
  tags        = each.value.tags

  dynamic "connector_provider" {
    for_each = each.value.connector_provider != null ? each.value.connector_provider : []
    content {

      dynamic "jira_cloud" {
        for_each = connector_provider.value.jira_cloud != null ? connector_provider.value.jira_cloud : []
        content {
          project_key = jira_cloud.value.project_key
        }
      }

      dynamic "service_now" {
        for_each = connector_provider.value.service_now != null ? connector_provider.value.service_now : []
        content {
          instance_name = service_now.value.instance_name
          secret_arn    = service_now.value.secret_arn
        }
      }
    }
  }
}
