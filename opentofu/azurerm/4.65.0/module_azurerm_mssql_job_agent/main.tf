resource "azurerm_mssql_job_agent" "mssql_job_agents" {
  for_each = var.mssql_job_agents

  database_id = each.value.database_id
  location    = each.value.location
  name        = each.value.name
  sku         = each.value.sku
  tags        = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }
}
