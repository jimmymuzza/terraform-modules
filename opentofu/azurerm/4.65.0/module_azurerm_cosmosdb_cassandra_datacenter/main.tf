resource "azurerm_cosmosdb_cassandra_datacenter" "cosmosdb_cassandra_datacenters" {
  for_each = var.cosmosdb_cassandra_datacenters

  cassandra_cluster_id            = each.value.cassandra_cluster_id
  delegated_management_subnet_id  = each.value.delegated_management_subnet_id
  location                        = each.value.location
  name                            = each.value.name
  availability_zones_enabled      = each.value.availability_zones_enabled
  backup_storage_customer_key_uri = each.value.backup_storage_customer_key_uri
  base64_encoded_yaml_fragment    = each.value.base64_encoded_yaml_fragment
  disk_count                      = each.value.disk_count
  disk_sku                        = each.value.disk_sku
  managed_disk_customer_key_uri   = each.value.managed_disk_customer_key_uri
  node_count                      = each.value.node_count
  sku_name                        = each.value.sku_name
}
