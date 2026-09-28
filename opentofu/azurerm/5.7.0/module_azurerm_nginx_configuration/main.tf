resource "azurerm_nginx_configuration" "nginx_configurations" {
  for_each = var.nginx_configurations

  nginx_deployment_id = each.value.nginx_deployment_id
  root_file           = each.value.root_file
  package_data        = each.value.package_data

  dynamic "config_file" {
    for_each = each.value.config_file != null ? each.value.config_file : []
    content {
      content      = config_file.value.content
      virtual_path = config_file.value.virtual_path
    }
  }

  dynamic "protected_file" {
    for_each = each.value.protected_file != null ? each.value.protected_file : []
    content {
      content      = protected_file.value.content
      virtual_path = protected_file.value.virtual_path
    }
  }
}
