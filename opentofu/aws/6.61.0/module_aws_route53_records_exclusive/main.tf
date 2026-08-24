resource "aws_route53_records_exclusive" "route53_records_exclusives" {
  for_each = var.route53_records_exclusives

  zone_id = each.value.zone_id

  dynamic "resource_record_set" {
    for_each = each.value.resource_record_set != null ? each.value.resource_record_set : []
    content {
      name                       = resource_record_set.value.name
      failover                   = resource_record_set.value.failover
      health_check_id            = resource_record_set.value.health_check_id
      multi_value_answer         = resource_record_set.value.multi_value_answer
      region                     = resource_record_set.value.region
      set_identifier             = resource_record_set.value.set_identifier
      traffic_policy_instance_id = resource_record_set.value.traffic_policy_instance_id
      ttl                        = resource_record_set.value.ttl
      type                       = resource_record_set.value.type
      weight                     = resource_record_set.value.weight

      dynamic "alias_target" {
        for_each = resource_record_set.value.alias_target != null ? resource_record_set.value.alias_target : []
        content {
          dns_name               = alias_target.value.dns_name
          evaluate_target_health = alias_target.value.evaluate_target_health
          hosted_zone_id         = alias_target.value.hosted_zone_id
        }
      }

      dynamic "cidr_routing_config" {
        for_each = resource_record_set.value.cidr_routing_config != null ? resource_record_set.value.cidr_routing_config : []
        content {
          collection_id = cidr_routing_config.value.collection_id
          location_name = cidr_routing_config.value.location_name
        }
      }

      dynamic "geolocation" {
        for_each = resource_record_set.value.geolocation != null ? resource_record_set.value.geolocation : []
        content {
          continent_code   = geolocation.value.continent_code
          country_code     = geolocation.value.country_code
          subdivision_code = geolocation.value.subdivision_code
        }
      }

      dynamic "geoproximity_location" {
        for_each = resource_record_set.value.geoproximity_location != null ? resource_record_set.value.geoproximity_location : []
        content {
          aws_region       = geoproximity_location.value.aws_region
          bias             = geoproximity_location.value.bias
          local_zone_group = geoproximity_location.value.local_zone_group

          dynamic "coordinates" {
            for_each = geoproximity_location.value.coordinates != null ? geoproximity_location.value.coordinates : []
            content {
              latitude  = coordinates.value.latitude
              longitude = coordinates.value.longitude
            }
          }
        }
      }

      dynamic "resource_records" {
        for_each = resource_record_set.value.resource_records != null ? resource_record_set.value.resource_records : []
        content {
          value = resource_records.value.value
        }
      }
    }
  }
}
