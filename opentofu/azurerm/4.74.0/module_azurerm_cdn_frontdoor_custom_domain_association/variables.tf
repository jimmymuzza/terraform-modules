variable "cdn_frontdoor_custom_domain_associations" {
  description = <<EOT
Map of cdn_frontdoor_custom_domain_associations, attributes below
Required:
    - cdn_frontdoor_custom_domain_id
    - cdn_frontdoor_route_ids
EOT

  type = map(object({
    cdn_frontdoor_custom_domain_id = string
    cdn_frontdoor_route_ids        = list(string)
  }))
}
