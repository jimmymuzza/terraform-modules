resource "aws_grafana_workspace" "grafana_workspaces" {
  for_each = var.grafana_workspaces

  account_access_type       = each.value.account_access_type
  authentication_providers  = each.value.authentication_providers
  permission_type           = each.value.permission_type
  configuration             = each.value.configuration
  data_sources              = each.value.data_sources
  description               = each.value.description
  grafana_version           = each.value.grafana_version
  kms_key_id                = each.value.kms_key_id
  name                      = each.value.name
  notification_destinations = each.value.notification_destinations
  organization_role_name    = each.value.organization_role_name
  organizational_units      = each.value.organizational_units
  region                    = each.value.region
  role_arn                  = each.value.role_arn
  stack_set_name            = each.value.stack_set_name
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "network_access_control" {
    for_each = each.value.network_access_control != null ? each.value.network_access_control : []
    content {
      prefix_list_ids = network_access_control.value.prefix_list_ids
      vpce_ids        = network_access_control.value.vpce_ids
    }
  }

  dynamic "vpc_configuration" {
    for_each = each.value.vpc_configuration != null ? each.value.vpc_configuration : []
    content {
      security_group_ids = vpc_configuration.value.security_group_ids
      subnet_ids         = vpc_configuration.value.subnet_ids
    }
  }
}
