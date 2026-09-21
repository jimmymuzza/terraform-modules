variable "codestarconnections_connections" {
  description = <<EOT
Map of codestarconnections_connections, attributes below
Required:
    - name
Optional:
    - host_arn
    - provider_type
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name          = string
    host_arn      = optional(string)
    provider_type = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
