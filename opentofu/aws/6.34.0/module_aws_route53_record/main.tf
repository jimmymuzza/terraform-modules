resource "aws_route53_record" "route53_records" {
  for_each = var.route53_records

  name                             = each.value.name
  type                             = each.value.type
  zone_id                          = each.value.zone_id
  allow_overwrite                  = each.value.allow_overwrite
  health_check_id                  = each.value.health_check_id
  multivalue_answer_routing_policy = each.value.multivalue_answer_routing_policy
  records                          = each.value.records
  set_identifier                   = each.value.set_identifier
  ttl                              = each.value.ttl

  dynamic "alias" {
    for_each = each.value.alias != null ? each.value.alias : []
    content {
      evaluate_target_health = alias.value.evaluate_target_health
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
    }
  }

  dynamic "cidr_routing_policy" {
    for_each = each.value.cidr_routing_policy != null ? each.value.cidr_routing_policy : []
    content {
      collection_id = cidr_routing_policy.value.collection_id
      location_name = cidr_routing_policy.value.location_name
    }
  }

  dynamic "failover_routing_policy" {
    for_each = each.value.failover_routing_policy != null ? each.value.failover_routing_policy : []
    content {
      type = failover_routing_policy.value.type
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = each.value.geolocation_routing_policy != null ? each.value.geolocation_routing_policy : []
    content {
      continent   = geolocation_routing_policy.value.continent
      country     = geolocation_routing_policy.value.country
      subdivision = geolocation_routing_policy.value.subdivision
    }
  }

  dynamic "geoproximity_routing_policy" {
    for_each = each.value.geoproximity_routing_policy != null ? each.value.geoproximity_routing_policy : []
    content {
      aws_region       = geoproximity_routing_policy.value.aws_region
      bias             = geoproximity_routing_policy.value.bias
      local_zone_group = geoproximity_routing_policy.value.local_zone_group

      dynamic "coordinates" {
        for_each = geoproximity_routing_policy.value.coordinates != null ? geoproximity_routing_policy.value.coordinates : []
        content {
          latitude  = coordinates.value.latitude
          longitude = coordinates.value.longitude
        }
      }
    }
  }

  dynamic "latency_routing_policy" {
    for_each = each.value.latency_routing_policy != null ? each.value.latency_routing_policy : []
    content {
      region = latency_routing_policy.value.region
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = each.value.weighted_routing_policy != null ? each.value.weighted_routing_policy : []
    content {
      weight = weighted_routing_policy.value.weight
    }
  }
}
