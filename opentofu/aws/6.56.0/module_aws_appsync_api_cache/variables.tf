variable "appsync_api_caches" {
  description = <<EOT
Map of appsync_api_caches, attributes below
Required:
    - api_caching_behavior
    - api_id
    - ttl
    - type
Optional:
    - at_rest_encryption_enabled
    - region
    - transit_encryption_enabled
EOT

  type = map(object({
    api_caching_behavior       = string
    api_id                     = string
    ttl                        = number
    type                       = string
    at_rest_encryption_enabled = optional(bool)
    region                     = optional(string)
    transit_encryption_enabled = optional(bool)
  }))
}
