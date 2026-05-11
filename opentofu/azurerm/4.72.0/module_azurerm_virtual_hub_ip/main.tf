resource "azurerm_virtual_hub_ip" "virtual_hub_ips" {
  for_each = var.virtual_hub_ips

  name                         = each.value.name
  public_ip_address_id         = each.value.public_ip_address_id
  subnet_id                    = each.value.subnet_id
  virtual_hub_id               = each.value.virtual_hub_id
  private_ip_address           = each.value.private_ip_address
  private_ip_allocation_method = each.value.private_ip_allocation_method
}
