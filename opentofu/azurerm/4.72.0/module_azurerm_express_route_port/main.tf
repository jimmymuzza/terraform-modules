resource "azurerm_express_route_port" "express_route_ports" {
  for_each = var.express_route_ports

  bandwidth_in_gbps   = each.value.bandwidth_in_gbps
  encapsulation       = each.value.encapsulation
  location            = each.value.location
  name                = each.value.name
  peering_location    = each.value.peering_location
  resource_group_name = each.value.resource_group_name
  billing_type        = each.value.billing_type
  tags                = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "link1" {
    for_each = each.value.link1 != null ? each.value.link1 : []
    content {
      admin_enabled                 = link1.value.admin_enabled
      macsec_cak_keyvault_secret_id = link1.value.macsec_cak_keyvault_secret_id
      macsec_cipher                 = link1.value.macsec_cipher
      macsec_ckn_keyvault_secret_id = link1.value.macsec_ckn_keyvault_secret_id
      macsec_sci_enabled            = link1.value.macsec_sci_enabled
    }
  }

  dynamic "link2" {
    for_each = each.value.link2 != null ? each.value.link2 : []
    content {
      admin_enabled                 = link2.value.admin_enabled
      macsec_cak_keyvault_secret_id = link2.value.macsec_cak_keyvault_secret_id
      macsec_cipher                 = link2.value.macsec_cipher
      macsec_ckn_keyvault_secret_id = link2.value.macsec_ckn_keyvault_secret_id
      macsec_sci_enabled            = link2.value.macsec_sci_enabled
    }
  }
}
