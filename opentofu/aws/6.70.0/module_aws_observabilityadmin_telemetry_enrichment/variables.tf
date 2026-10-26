variable "observabilityadmin_telemetry_enrichments" {
  description = <<EOT
Map of observabilityadmin_telemetry_enrichments, attributes below
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
  }))
}
