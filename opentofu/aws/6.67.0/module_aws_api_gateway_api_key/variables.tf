variable "api_gateway_api_keys" {
  description = <<EOT
Map of api_gateway_api_keys, attributes below
Required:
    - name
Optional:
    - customer_id
    - description
    - enabled
    - region
    - tags
    - tags_all
    - value
EOT

  type = map(object({
    name        = string
    customer_id = optional(string)
    description = optional(string)
    enabled     = optional(bool)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    value       = optional(string)
  }))
}
