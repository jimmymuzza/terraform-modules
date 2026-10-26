resource "azurerm_dev_center_catalog" "dev_center_catalogs" {
  for_each = var.dev_center_catalogs

  dev_center_id       = each.value.dev_center_id
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  dynamic "catalog_adogit" {
    for_each = each.value.catalog_adogit != null ? each.value.catalog_adogit : []
    content {
      branch            = catalog_adogit.value.branch
      key_vault_key_url = catalog_adogit.value.key_vault_key_url
      path              = catalog_adogit.value.path
      uri               = catalog_adogit.value.uri
    }
  }

  dynamic "catalog_github" {
    for_each = each.value.catalog_github != null ? each.value.catalog_github : []
    content {
      branch            = catalog_github.value.branch
      key_vault_key_url = catalog_github.value.key_vault_key_url
      path              = catalog_github.value.path
      uri               = catalog_github.value.uri
    }
  }
}
