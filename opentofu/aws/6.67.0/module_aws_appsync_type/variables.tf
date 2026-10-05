variable "appsync_types" {
  description = <<EOT
Map of appsync_types, attributes below
Required:
    - api_id
    - definition
    - format
Optional:
    - region
EOT

  type = map(object({
    api_id     = string
    definition = string
    format     = string
    region     = optional(string)
  }))
}
