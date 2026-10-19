resource "azurerm_spring_cloud_build_deployment" "spring_cloud_build_deployments" {
  for_each = var.spring_cloud_build_deployments

  build_result_id                        = each.value.build_result_id
  name                                   = each.value.name
  spring_cloud_app_id                    = each.value.spring_cloud_app_id
  addon_json                             = each.value.addon_json
  application_performance_monitoring_ids = each.value.application_performance_monitoring_ids
  environment_variables                  = each.value.environment_variables
  instance_count                         = each.value.instance_count

  dynamic "quota" {
    for_each = each.value.quota != null ? each.value.quota : []
    content {
      cpu    = quota.value.cpu
      memory = quota.value.memory
    }
  }
}
