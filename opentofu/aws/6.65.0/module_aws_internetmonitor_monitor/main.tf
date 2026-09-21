resource "aws_internetmonitor_monitor" "internetmonitor_monitors" {
  for_each = var.internetmonitor_monitors

  monitor_name                  = each.value.monitor_name
  max_city_networks_to_monitor  = each.value.max_city_networks_to_monitor
  region                        = each.value.region
  resources                     = each.value.resources
  status                        = each.value.status
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  traffic_percentage_to_monitor = each.value.traffic_percentage_to_monitor

  dynamic "health_events_config" {
    for_each = each.value.health_events_config != null ? each.value.health_events_config : []
    content {
      availability_score_threshold = health_events_config.value.availability_score_threshold
      performance_score_threshold  = health_events_config.value.performance_score_threshold
    }
  }

  dynamic "internet_measurements_log_delivery" {
    for_each = each.value.internet_measurements_log_delivery != null ? each.value.internet_measurements_log_delivery : []
    content {

      dynamic "s3_config" {
        for_each = internet_measurements_log_delivery.value.s3_config != null ? internet_measurements_log_delivery.value.s3_config : []
        content {
          bucket_name         = s3_config.value.bucket_name
          bucket_prefix       = s3_config.value.bucket_prefix
          log_delivery_status = s3_config.value.log_delivery_status
        }
      }
    }
  }
}
