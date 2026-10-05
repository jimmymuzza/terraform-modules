resource "azurerm_kusto_cluster_managed_private_endpoint" "kusto_cluster_managed_private_endpoints" {
  for_each = var.kusto_cluster_managed_private_endpoints

  cluster_name                 = each.value.cluster_name
  group_id                     = each.value.group_id
  name                         = each.value.name
  private_link_resource_id     = each.value.private_link_resource_id
  resource_group_name          = each.value.resource_group_name
  private_link_resource_region = each.value.private_link_resource_region
  request_message              = each.value.request_message
}
