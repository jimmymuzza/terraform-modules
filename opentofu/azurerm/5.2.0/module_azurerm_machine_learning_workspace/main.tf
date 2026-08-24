resource "azurerm_machine_learning_workspace" "machine_learning_workspaces" {
  for_each = var.machine_learning_workspaces

  application_insights_id         = each.value.application_insights_id
  key_vault_id                    = each.value.key_vault_id
  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  storage_account_id              = each.value.storage_account_id
  container_registry_id           = each.value.container_registry_id
  description                     = each.value.description
  friendly_name                   = each.value.friendly_name
  high_business_impact            = each.value.high_business_impact
  image_build_compute_name        = each.value.image_build_compute_name
  kind                            = each.value.kind
  primary_user_assigned_identity  = each.value.primary_user_assigned_identity
  public_network_access_enabled   = each.value.public_network_access_enabled
  service_side_encryption_enabled = each.value.service_side_encryption_enabled
  sku_name                        = each.value.sku_name
  storage_account_access_type     = each.value.storage_account_access_type
  tags                            = each.value.tags
  v1_legacy_mode_enabled          = each.value.v1_legacy_mode_enabled

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      key_id                    = encryption.value.key_id
      key_vault_id              = encryption.value.key_vault_id
      user_assigned_identity_id = encryption.value.user_assigned_identity_id
    }
  }

  dynamic "feature_store" {
    for_each = each.value.feature_store != null ? each.value.feature_store : []
    content {
      computer_spark_runtime_version = feature_store.value.computer_spark_runtime_version
      offline_connection_name        = feature_store.value.offline_connection_name
      online_connection_name         = feature_store.value.online_connection_name
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "managed_network" {
    for_each = each.value.managed_network != null ? each.value.managed_network : []
    content {
      isolation_mode                = managed_network.value.isolation_mode
      provision_on_creation_enabled = managed_network.value.provision_on_creation_enabled
    }
  }

  dynamic "serverless_compute" {
    for_each = each.value.serverless_compute != null ? each.value.serverless_compute : []
    content {
      public_ip_enabled = serverless_compute.value.public_ip_enabled
      subnet_id         = serverless_compute.value.subnet_id
    }
  }
}
