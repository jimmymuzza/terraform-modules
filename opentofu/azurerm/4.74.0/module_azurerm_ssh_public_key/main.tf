resource "azurerm_ssh_public_key" "ssh_public_keys" {
  for_each = var.ssh_public_keys

  location            = each.value.location
  name                = each.value.name
  public_key          = each.value.public_key
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
