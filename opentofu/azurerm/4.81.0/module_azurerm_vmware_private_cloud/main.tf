resource "azurerm_vmware_private_cloud" "vmware_private_clouds" {
  for_each = var.vmware_private_clouds

  location                    = each.value.location
  name                        = each.value.name
  network_subnet_cidr         = each.value.network_subnet_cidr
  resource_group_name         = each.value.resource_group_name
  sku_name                    = each.value.sku_name
  internet_connection_enabled = each.value.internet_connection_enabled
  nsxt_password               = each.value.nsxt_password
  tags                        = each.value.tags
  vcenter_password            = each.value.vcenter_password

  dynamic "management_cluster" {
    for_each = each.value.management_cluster != null ? each.value.management_cluster : []
    content {
      size = management_cluster.value.size
    }
  }
}
