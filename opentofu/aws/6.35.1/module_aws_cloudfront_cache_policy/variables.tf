variable "cloudfront_cache_policies" {
  description = <<EOT
Map of cloudfront_cache_policies, attributes below
Required:
    - name
    - parameters_in_cache_key_and_forwarded_to_origin
Optional:
    - comment
    - default_ttl
    - max_ttl
    - min_ttl
EOT

  type = map(object({
    name                                            = string
    comment                                         = optional(string)
    default_ttl                                     = optional(number)
    max_ttl                                         = optional(number)
    min_ttl                                         = optional(number)
    parameters_in_cache_key_and_forwarded_to_origin = list(object({
            enable_accept_encoding_brotli = optional(bool)
            enable_accept_encoding_gzip   = optional(bool)
            cookies_config                = list(object({
                cookie_behavior = string
                cookies         = optional(list(object({
                    items = optional(set(string))
                })))
            }))
            headers_config                = list(object({
                header_behavior = optional(string)
                headers         = optional(list(object({
                    items = optional(set(string))
                })))
            }))
            query_strings_config          = list(object({
                query_string_behavior = string
                query_strings         = optional(list(object({
                    items = optional(set(string))
                })))
            }))
        }))
  }))
}
