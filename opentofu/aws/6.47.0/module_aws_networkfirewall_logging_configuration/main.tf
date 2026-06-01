resource "aws_networkfirewall_logging_configuration" "networkfirewall_logging_configurations" {
  for_each = var.networkfirewall_logging_configurations

  firewall_arn                = each.value.firewall_arn
  enable_monitoring_dashboard = each.value.enable_monitoring_dashboard
  region                      = each.value.region

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {

      dynamic "log_destination_config" {
        for_each = logging_configuration.value.log_destination_config != null ? logging_configuration.value.log_destination_config : []
        content {
          log_destination      = log_destination_config.value.log_destination
          log_destination_type = log_destination_config.value.log_destination_type
          log_type             = log_destination_config.value.log_type
        }
      }
    }
  }
}
