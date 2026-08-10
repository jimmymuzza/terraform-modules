resource "azurerm_kusto_cluster" "kusto_clusters" {
  for_each = var.kusto_clusters

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  allowed_fqdns                      = each.value.allowed_fqdns
  allowed_ip_ranges                  = each.value.allowed_ip_ranges
  auto_stop_enabled                  = each.value.auto_stop_enabled
  disk_encryption_enabled            = each.value.disk_encryption_enabled
  double_encryption_enabled          = each.value.double_encryption_enabled
  outbound_network_access_restricted = each.value.outbound_network_access_restricted
  public_ip_type                     = each.value.public_ip_type
  public_network_access_enabled      = each.value.public_network_access_enabled
  purge_enabled                      = each.value.purge_enabled
  streaming_ingestion_enabled        = each.value.streaming_ingestion_enabled
  tags                               = each.value.tags
  trusted_external_tenants           = each.value.trusted_external_tenants
  zones                              = each.value.zones

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "language_extension" {
    for_each = each.value.language_extension != null ? each.value.language_extension : []
    content {
      image = language_extension.value.image
      name  = language_extension.value.name
    }
  }

  dynamic "optimized_auto_scale" {
    for_each = each.value.optimized_auto_scale != null ? each.value.optimized_auto_scale : []
    content {
      maximum_instances = optimized_auto_scale.value.maximum_instances
      minimum_instances = optimized_auto_scale.value.minimum_instances
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      name     = sku.value.name
      capacity = sku.value.capacity
    }
  }
}
