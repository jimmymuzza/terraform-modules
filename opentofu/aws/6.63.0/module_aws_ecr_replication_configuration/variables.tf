variable "ecr_replication_configurations" {
  description = <<EOT
Map of ecr_replication_configurations, attributes below
Optional:
    - region
    - replication_configuration
EOT

  type = map(object({
    region                    = optional(string)
    replication_configuration = optional(list(object({
            rule = list(object({
                destination       = list(object({
                    region      = string
                    registry_id = string
                }))
                repository_filter = optional(list(object({
                    filter      = string
                    filter_type = string
                })))
            }))
        })))
  }))
}
