resource "azurerm_dev_test_windows_virtual_machine" "dev_test_windows_virtual_machines" {
  for_each = var.dev_test_windows_virtual_machines

  lab_name                   = each.value.lab_name
  lab_subnet_name            = each.value.lab_subnet_name
  lab_virtual_network_id     = each.value.lab_virtual_network_id
  location                   = each.value.location
  name                       = each.value.name
  password                   = each.value.password
  resource_group_name        = each.value.resource_group_name
  size                       = each.value.size
  storage_type               = each.value.storage_type
  username                   = each.value.username
  allow_claim                = each.value.allow_claim
  disallow_public_ip_address = each.value.disallow_public_ip_address
  notes                      = each.value.notes
  tags                       = each.value.tags

  dynamic "gallery_image_reference" {
    for_each = each.value.gallery_image_reference != null ? each.value.gallery_image_reference : []
    content {
      offer     = gallery_image_reference.value.offer
      publisher = gallery_image_reference.value.publisher
      sku       = gallery_image_reference.value.sku
      version   = gallery_image_reference.value.version
    }
  }

  dynamic "inbound_nat_rule" {
    for_each = each.value.inbound_nat_rule != null ? each.value.inbound_nat_rule : []
    content {
      backend_port = inbound_nat_rule.value.backend_port
      protocol     = inbound_nat_rule.value.protocol
    }
  }
}
