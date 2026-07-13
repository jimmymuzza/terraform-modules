resource "azurerm_vmware_express_route_authorization" "vmware_express_route_authorizations" {
  for_each = var.vmware_express_route_authorizations

  name             = each.value.name
  private_cloud_id = each.value.private_cloud_id
}
