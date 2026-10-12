variable "networkfirewall_container_associations" {
  description = <<EOT
Map of networkfirewall_container_associations, attributes below
Required:
    - container_association_name
    - type
Optional:
    - description
    - region
    - tags
    - container_monitoring_configuration
EOT

  type = map(object({
    container_association_name         = string
    type                               = string
    description                        = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    container_monitoring_configuration = optional(list(object({
            cluster_arn      = string
            attribute_filter = optional(list(object({
                key   = string
                value = string
            })))
        })))
  }))
}
