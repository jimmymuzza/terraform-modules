variable "route53_traffic_policy_instances" {
  description = <<EOT
Map of route53_traffic_policy_instances, attributes below
Required:
    - hosted_zone_id
    - name
    - traffic_policy_id
    - traffic_policy_version
    - ttl
EOT

  type = map(object({
    hosted_zone_id         = string
    name                   = string
    traffic_policy_id      = string
    traffic_policy_version = number
    ttl                    = number
  }))
}
