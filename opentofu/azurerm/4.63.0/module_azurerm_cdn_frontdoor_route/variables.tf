variable "cdn_frontdoor_routes" {
  description = <<EOT
Map of cdn_frontdoor_routes, attributes below
Required:
    - cdn_frontdoor_endpoint_id
    - cdn_frontdoor_origin_group_id
    - cdn_frontdoor_origin_ids
    - name
    - patterns_to_match
    - supported_protocols
Optional:
    - cdn_frontdoor_custom_domain_ids
    - cdn_frontdoor_origin_path
    - cdn_frontdoor_rule_set_ids
    - enabled
    - forwarding_protocol
    - https_redirect_enabled
    - link_to_default_domain
    - cache
EOT

  type = map(object({
    cdn_frontdoor_endpoint_id       = string
    cdn_frontdoor_origin_group_id   = string
    cdn_frontdoor_origin_ids        = list(string)
    name                            = string
    patterns_to_match               = list(string)
    supported_protocols             = set(string)
    cdn_frontdoor_custom_domain_ids = optional(set(string))
    cdn_frontdoor_origin_path       = optional(string)
    cdn_frontdoor_rule_set_ids      = optional(set(string))
    enabled                         = optional(bool)
    forwarding_protocol             = optional(string)
    https_redirect_enabled          = optional(bool)
    link_to_default_domain          = optional(bool)
    cache                           = optional(list(object({
            compression_enabled           = optional(bool)
            content_types_to_compress     = optional(list(string))
            query_string_caching_behavior = optional(string)
            query_strings                 = optional(list(string))
        })))
  }))
}
