resource "azurerm_kusto_attached_database_configuration" "kusto_attached_database_configurations" {
  for_each = var.kusto_attached_database_configurations

  cluster_name                        = each.value.cluster_name
  database_name                       = each.value.database_name
  location                            = each.value.location
  name                                = each.value.name
  resource_group_name                 = each.value.resource_group_name
  cluster_id                          = each.value.cluster_id
  cluster_resource_id                 = each.value.cluster_resource_id
  default_principal_modification_kind = each.value.default_principal_modification_kind

  dynamic "sharing" {
    for_each = each.value.sharing != null ? each.value.sharing : []
    content {
      external_tables_to_exclude    = sharing.value.external_tables_to_exclude
      external_tables_to_include    = sharing.value.external_tables_to_include
      materialized_views_to_exclude = sharing.value.materialized_views_to_exclude
      materialized_views_to_include = sharing.value.materialized_views_to_include
      tables_to_exclude             = sharing.value.tables_to_exclude
      tables_to_include             = sharing.value.tables_to_include
    }
  }
}
