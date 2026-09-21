resource "azurerm_mssql_job_target_group" "mssql_job_target_groups" {
  for_each = var.mssql_job_target_groups

  job_agent_id = each.value.job_agent_id
  name         = each.value.name

  dynamic "job_target" {
    for_each = each.value.job_target != null ? each.value.job_target : []
    content {
      server_name       = job_target.value.server_name
      database_name     = job_target.value.database_name
      elastic_pool_name = job_target.value.elastic_pool_name
      job_credential_id = job_target.value.job_credential_id
      membership_type   = job_target.value.membership_type
    }
  }
}
