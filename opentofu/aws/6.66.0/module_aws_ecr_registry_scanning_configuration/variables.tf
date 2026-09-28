variable "ecr_registry_scanning_configurations" {
  description = <<EOT
Map of ecr_registry_scanning_configurations, attributes below
Required:
    - scan_type
Optional:
    - region
    - rule
EOT

  type = map(object({
    scan_type = string
    region    = optional(string)
    rule      = optional(set(object({
            scan_frequency    = string
            repository_filter = set(object({
                filter      = string
                filter_type = string
            }))
        })))
  }))
}
