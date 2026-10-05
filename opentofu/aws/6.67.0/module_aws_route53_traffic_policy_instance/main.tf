resource "aws_route53_traffic_policy_instance" "route53_traffic_policy_instances" {
  for_each = var.route53_traffic_policy_instances

  hosted_zone_id         = each.value.hosted_zone_id
  name                   = each.value.name
  traffic_policy_id      = each.value.traffic_policy_id
  traffic_policy_version = each.value.traffic_policy_version
  ttl                    = each.value.ttl
}
