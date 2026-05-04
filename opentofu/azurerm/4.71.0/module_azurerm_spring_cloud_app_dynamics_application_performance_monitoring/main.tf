resource "azurerm_spring_cloud_app_dynamics_application_performance_monitoring" "spring_cloud_app_dynamics_application_performance_monitorings" {
  for_each = var.spring_cloud_app_dynamics_application_performance_monitorings

  agent_account_access_key = each.value.agent_account_access_key
  agent_account_name       = each.value.agent_account_name
  controller_host_name     = each.value.controller_host_name
  name                     = each.value.name
  spring_cloud_service_id  = each.value.spring_cloud_service_id
  agent_application_name   = each.value.agent_application_name
  agent_node_name          = each.value.agent_node_name
  agent_tier_name          = each.value.agent_tier_name
  agent_unique_host_id     = each.value.agent_unique_host_id
  controller_port          = each.value.controller_port
  controller_ssl_enabled   = each.value.controller_ssl_enabled
  globally_enabled         = each.value.globally_enabled
}
