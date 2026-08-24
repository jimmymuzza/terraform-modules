variable "cloudfront_connection_groups" {
  description = <<EOT
Map of cloudfront_connection_groups, attributes below
Required:
    - name
Optional:
    - anycast_ip_list_id
    - enabled
    - ipv6_enabled
    - tags
    - wait_for_deployment
EOT

  type = map(object({
    name                = string
    anycast_ip_list_id  = optional(string)
    enabled             = optional(bool)
    ipv6_enabled        = optional(bool)
    tags                = optional(map(string))
    wait_for_deployment = optional(bool)
  }))
}
