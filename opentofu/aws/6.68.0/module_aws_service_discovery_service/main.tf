resource "aws_service_discovery_service" "service_discovery_services" {
  for_each = var.service_discovery_services

  name          = each.value.name
  description   = each.value.description
  force_destroy = each.value.force_destroy
  namespace_id  = each.value.namespace_id
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
  type          = each.value.type

  dynamic "dns_config" {
    for_each = each.value.dns_config != null ? each.value.dns_config : []
    content {
      namespace_id   = dns_config.value.namespace_id
      routing_policy = dns_config.value.routing_policy

      dynamic "dns_records" {
        for_each = dns_config.value.dns_records != null ? dns_config.value.dns_records : []
        content {
          ttl  = dns_records.value.ttl
          type = dns_records.value.type
        }
      }
    }
  }

  dynamic "health_check_config" {
    for_each = each.value.health_check_config != null ? each.value.health_check_config : []
    content {
      failure_threshold = health_check_config.value.failure_threshold
      resource_path     = health_check_config.value.resource_path
      type              = health_check_config.value.type
    }
  }

  dynamic "health_check_custom_config" {
    for_each = each.value.health_check_custom_config != null ? each.value.health_check_custom_config : []
    content {
      failure_threshold = health_check_custom_config.value.failure_threshold
    }
  }
}
