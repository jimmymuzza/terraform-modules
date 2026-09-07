resource "aws_prometheus_scraper_logging_configuration" "prometheus_scraper_logging_configurations" {
  for_each = var.prometheus_scraper_logging_configurations

  scraper_id         = each.value.scraper_id
  region             = each.value.region
  scraper_components = each.value.scraper_components

  dynamic "logging_destination" {
    for_each = each.value.logging_destination != null ? each.value.logging_destination : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = logging_destination.value.cloudwatch_logs != null ? logging_destination.value.cloudwatch_logs : []
        content {
          log_group_arn = cloudwatch_logs.value.log_group_arn
        }
      }
    }
  }
}
