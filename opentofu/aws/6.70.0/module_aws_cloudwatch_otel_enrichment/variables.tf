variable "cloudwatch_otel_enrichments" {
  description = <<EOT
Map of cloudwatch_otel_enrichments, attributes below
Optional:
    - region
    - exclude_filter
    - include_filter
EOT

  type = map(object({
    region         = optional(string)
    exclude_filter = optional(set(object({
            namespace    = string
            metric_names = optional(set(string))
        })))
    include_filter = optional(set(object({
            namespace    = string
            metric_names = optional(set(string))
        })))
  }))
}
