resource "aws_odb_autonomous_database_secrets_manager_integration" "odb_autonomous_database_secrets_manager_integrations" {
  for_each = var.odb_autonomous_database_secrets_manager_integrations

  region = each.value.region
}
