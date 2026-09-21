variable "cloudwatch_log_delivery_sources" {
  description = <<EOT
Map of cloudwatch_log_delivery_sources, attributes below
Required:
    - log_type
    - name
    - resource_arn
Optional:
    - region
    - tags
EOT

  type = map(object({
    log_type     = string
    name         = string
    resource_arn = string
    region       = optional(string)
    tags         = optional(map(string))
  }))
}
