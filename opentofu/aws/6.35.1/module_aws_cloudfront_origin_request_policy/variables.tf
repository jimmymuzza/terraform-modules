variable "cloudfront_origin_request_policies" {
  description = <<EOT
Map of cloudfront_origin_request_policies, attributes below
Required:
    - name
    - cookies_config
    - headers_config
    - query_strings_config
Optional:
    - comment
EOT

  type = map(object({
    name                 = string
    comment              = optional(string)
    cookies_config       = list(object({
            cookie_behavior = string
            cookies         = optional(list(object({
                items = optional(set(string))
            })))
        }))
    headers_config       = list(object({
            header_behavior = optional(string)
            headers         = optional(list(object({
                items = optional(set(string))
            })))
        }))
    query_strings_config = list(object({
            query_string_behavior = string
            query_strings         = optional(list(object({
                items = optional(set(string))
            })))
        }))
  }))
}
