variable "lightsail_distributions" {
  description = <<EOT
Map of lightsail_distributions, attributes below
Required:
    - bundle_id
    - name
    - default_cache_behavior
    - origin
Optional:
    - certificate_name
    - ip_address_type
    - is_enabled
    - region
    - tags
    - tags_all
    - cache_behavior
    - cache_behavior_settings
EOT

  type = map(object({
    bundle_id               = string
    name                    = string
    certificate_name        = optional(string)
    ip_address_type         = optional(string)
    is_enabled              = optional(bool)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    cache_behavior          = optional(set(object({
            behavior = string
            path     = string
        })))
    cache_behavior_settings = optional(list(object({
            allowed_http_methods    = optional(string)
            cached_http_methods     = optional(string)
            default_ttl             = optional(number)
            maximum_ttl             = optional(number)
            minimum_ttl             = optional(number)
            forwarded_cookies       = optional(list(object({
                cookies_allow_list = optional(set(string))
                option             = optional(string)
            })))
            forwarded_headers       = optional(list(object({
                headers_allow_list = optional(set(string))
                option             = optional(string)
            })))
            forwarded_query_strings = optional(list(object({
                option                     = optional(bool)
                query_strings_allowed_list = optional(set(string))
            })))
        })))
    default_cache_behavior  = list(object({
            behavior = string
        }))
    origin                  = list(object({
            name            = string
            region_name     = string
            protocol_policy = optional(string)
        }))
  }))
}
