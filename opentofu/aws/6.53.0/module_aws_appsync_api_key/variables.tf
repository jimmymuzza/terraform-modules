variable "appsync_api_keys" {
  description = <<EOT
Map of appsync_api_keys, attributes below
Required:
    - api_id
Optional:
    - description
    - expires
    - region
EOT

  type = map(object({
    api_id      = string
    description = optional(string)
    expires     = optional(string)
    region      = optional(string)
  }))
}
