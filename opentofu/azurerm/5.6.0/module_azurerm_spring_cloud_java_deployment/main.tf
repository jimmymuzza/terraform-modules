resource "azurerm_spring_cloud_java_deployment" "spring_cloud_java_deployments" {
  for_each = var.spring_cloud_java_deployments

  name                  = each.value.name
  spring_cloud_app_id   = each.value.spring_cloud_app_id
  environment_variables = each.value.environment_variables
  instance_count        = each.value.instance_count
  jvm_options           = each.value.jvm_options
  runtime_version       = each.value.runtime_version

  dynamic "quota" {
    for_each = each.value.quota != null ? each.value.quota : []
    content {
      cpu    = quota.value.cpu
      memory = quota.value.memory
    }
  }
}
