resource "azurerm_mssql_job" "mssql_jobs" {
  for_each = var.mssql_jobs

  job_agent_id = each.value.job_agent_id
  name         = each.value.name
  description  = each.value.description
}
