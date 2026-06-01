variable "observabilityadmin_telemetry_evaluations" {
  description = <<EOT
Map of observabilityadmin_telemetry_evaluations, attributes below
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
  }))
}
