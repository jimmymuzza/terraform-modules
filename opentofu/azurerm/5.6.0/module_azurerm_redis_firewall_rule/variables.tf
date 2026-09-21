variable "redis_firewall_rules" {
  description = <<EOT
Map of redis_firewall_rules, attributes below
Required:
    - end_ip
    - name
    - redis_cache_name
    - resource_group_name
    - start_ip
EOT

  type = map(object({
    end_ip              = string
    name                = string
    redis_cache_name    = string
    resource_group_name = string
    start_ip            = string
  }))
}
