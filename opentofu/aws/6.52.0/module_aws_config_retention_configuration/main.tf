resource "aws_config_retention_configuration" "config_retention_configurations" {
  for_each = var.config_retention_configurations

  retention_period_in_days = each.value.retention_period_in_days
  region                   = each.value.region
}
