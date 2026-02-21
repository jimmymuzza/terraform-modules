resource "azurerm_mongo_cluster" "mongo_clusters" {
  for_each = var.mongo_clusters

  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  administrator_password = each.value.administrator_password
  administrator_username = each.value.administrator_username
  authentication_methods = each.value.authentication_methods
  compute_tier           = each.value.compute_tier
  create_mode            = each.value.create_mode
  data_api_mode_enabled  = each.value.data_api_mode_enabled
  high_availability_mode = each.value.high_availability_mode
  preview_features       = each.value.preview_features
  public_network_access  = each.value.public_network_access
  shard_count            = each.value.shard_count
  source_location        = each.value.source_location
  source_server_id       = each.value.source_server_id
  storage_size_in_gb     = each.value.storage_size_in_gb
  storage_type           = each.value.storage_type
  tags                   = each.value.tags
  version                = each.value.version

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "restore" {
    for_each = each.value.restore != null ? each.value.restore : []
    content {
      point_in_time_utc = restore.value.point_in_time_utc
      source_id         = restore.value.source_id
    }
  }
}
