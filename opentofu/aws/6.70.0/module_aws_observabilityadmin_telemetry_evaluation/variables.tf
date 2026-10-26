variable "observabilityadmin_telemetry_evaluations" {
  description = <<EOT
Map of observabilityadmin_telemetry_evaluations, attributes below
Optional:
    - all_regions
    - region
    - regions
EOT

  type = map(object({
    all_regions = optional(bool)
    region      = optional(string)
    regions     = optional(set(string))
  }))
}
