resource "azurerm_dev_test_virtual_network" "dev_test_virtual_networks" {
  for_each = var.dev_test_virtual_networks

  lab_name            = each.value.lab_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      use_in_virtual_machine_creation = subnet.value.use_in_virtual_machine_creation
      use_public_ip_address           = subnet.value.use_public_ip_address

      dynamic "shared_public_ip_address" {
        for_each = subnet.value.shared_public_ip_address != null ? subnet.value.shared_public_ip_address : []
        content {

          dynamic "allowed_ports" {
            for_each = shared_public_ip_address.value.allowed_ports != null ? shared_public_ip_address.value.allowed_ports : []
            content {
              backend_port       = allowed_ports.value.backend_port
              transport_protocol = allowed_ports.value.transport_protocol
            }
          }
        }
      }
    }
  }
}
