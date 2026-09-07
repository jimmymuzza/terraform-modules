resource "azurerm_mssql_job_credential" "mssql_job_credentials" {
  for_each = var.mssql_job_credentials

  job_agent_id        = each.value.job_agent_id
  name                = each.value.name
  username            = each.value.username
  password            = each.value.password
  password_wo         = each.value.password_wo
  password_wo_version = each.value.password_wo_version
}
