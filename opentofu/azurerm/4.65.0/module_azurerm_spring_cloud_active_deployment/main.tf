resource "azurerm_spring_cloud_active_deployment" "spring_cloud_active_deployments" {
  for_each = var.spring_cloud_active_deployments

  deployment_name     = each.value.deployment_name
  spring_cloud_app_id = each.value.spring_cloud_app_id
}
