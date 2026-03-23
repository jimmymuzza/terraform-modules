variable "rds_cluster_endpoints" {
  description = <<EOT
Map of rds_cluster_endpoints, attributes below
Required:
    - cluster_endpoint_identifier
    - cluster_identifier
    - custom_endpoint_type
Optional:
    - excluded_members
    - region
    - static_members
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_endpoint_identifier = string
    cluster_identifier          = string
    custom_endpoint_type        = string
    excluded_members            = optional(set(string))
    region                      = optional(string)
    static_members              = optional(set(string))
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
