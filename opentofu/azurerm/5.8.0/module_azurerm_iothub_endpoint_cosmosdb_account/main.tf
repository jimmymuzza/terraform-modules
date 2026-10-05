resource "azurerm_iothub_endpoint_cosmosdb_account" "iothub_endpoint_cosmosdb_accounts" {
  for_each = var.iothub_endpoint_cosmosdb_accounts

  container_name         = each.value.container_name
  database_name          = each.value.database_name
  endpoint_uri           = each.value.endpoint_uri
  iothub_id              = each.value.iothub_id
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  authentication_type    = each.value.authentication_type
  identity_id            = each.value.identity_id
  partition_key_name     = each.value.partition_key_name
  partition_key_template = each.value.partition_key_template
  primary_key            = each.value.primary_key
  secondary_key          = each.value.secondary_key
  subscription_id        = each.value.subscription_id
}
