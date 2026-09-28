variable "cloudwatch_otel_enrichments" {
  description = <<EOT
Map of cloudwatch_otel_enrichments, attributes below
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
  }))
}
