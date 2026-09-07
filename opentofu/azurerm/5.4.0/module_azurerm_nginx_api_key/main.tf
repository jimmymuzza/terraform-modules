resource "azurerm_nginx_api_key" "nginx_api_keys" {
  for_each = var.nginx_api_keys

  end_date_time       = each.value.end_date_time
  name                = each.value.name
  nginx_deployment_id = each.value.nginx_deployment_id
  secret_text         = each.value.secret_text
}
