resource "azurerm_spring_cloud_app_mysql_association" "spring_cloud_app_mysql_associations" {
  for_each = var.spring_cloud_app_mysql_associations

  database_name       = each.value.database_name
  mysql_server_id     = each.value.mysql_server_id
  name                = each.value.name
  password            = each.value.password
  spring_cloud_app_id = each.value.spring_cloud_app_id
  username            = each.value.username
}
