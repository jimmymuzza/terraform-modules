variable "api_gateway_usage_plans" {
  description = <<EOT
Map of api_gateway_usage_plans, attributes below
Required:
    - name
Optional:
    - description
    - product_code
    - region
    - tags
    - tags_all
    - api_stages
    - quota_settings
    - throttle_settings
EOT

  type = map(object({
    name              = string
    description       = optional(string)
    product_code      = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    api_stages        = optional(set(object({
            api_id   = string
            stage    = string
            throttle = optional(set(object({
                path        = string
                burst_limit = optional(number)
                rate_limit  = optional(number)
            })))
        })))
    quota_settings    = optional(list(object({
            limit  = number
            period = string
            offset = optional(number)
        })))
    throttle_settings = optional(list(object({
            burst_limit = optional(number)
            rate_limit  = optional(number)
        })))
  }))
}
