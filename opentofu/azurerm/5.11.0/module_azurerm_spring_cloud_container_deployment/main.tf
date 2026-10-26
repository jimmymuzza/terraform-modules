resource "azurerm_spring_cloud_container_deployment" "spring_cloud_container_deployments" {
  for_each = var.spring_cloud_container_deployments

  image                                  = each.value.image
  name                                   = each.value.name
  server                                 = each.value.server
  spring_cloud_app_id                    = each.value.spring_cloud_app_id
  addon_json                             = each.value.addon_json
  application_performance_monitoring_ids = each.value.application_performance_monitoring_ids
  arguments                              = each.value.arguments
  commands                               = each.value.commands
  environment_variables                  = each.value.environment_variables
  instance_count                         = each.value.instance_count
  language_framework                     = each.value.language_framework

  dynamic "quota" {
    for_each = each.value.quota != null ? each.value.quota : []
    content {
      cpu    = quota.value.cpu
      memory = quota.value.memory
    }
  }
}
