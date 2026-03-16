resource "aws_cloudfront_continuous_deployment_policy" "cloudfront_continuous_deployment_policies" {
  for_each = var.cloudfront_continuous_deployment_policies

  enabled = each.value.enabled

  dynamic "staging_distribution_dns_names" {
    for_each = each.value.staging_distribution_dns_names != null ? each.value.staging_distribution_dns_names : []
    content {
      quantity = staging_distribution_dns_names.value.quantity
      items    = staging_distribution_dns_names.value.items
    }
  }

  dynamic "traffic_config" {
    for_each = each.value.traffic_config != null ? each.value.traffic_config : []
    content {
      type = traffic_config.value.type

      dynamic "single_header_config" {
        for_each = traffic_config.value.single_header_config != null ? traffic_config.value.single_header_config : []
        content {
          header = single_header_config.value.header
          value  = single_header_config.value.value
        }
      }

      dynamic "single_weight_config" {
        for_each = traffic_config.value.single_weight_config != null ? traffic_config.value.single_weight_config : []
        content {
          weight = single_weight_config.value.weight

          dynamic "session_stickiness_config" {
            for_each = single_weight_config.value.session_stickiness_config != null ? single_weight_config.value.session_stickiness_config : []
            content {
              idle_ttl    = session_stickiness_config.value.idle_ttl
              maximum_ttl = session_stickiness_config.value.maximum_ttl
            }
          }
        }
      }
    }
  }
}
