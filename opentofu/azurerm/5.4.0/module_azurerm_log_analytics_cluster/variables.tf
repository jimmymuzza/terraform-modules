variable "log_analytics_clusters" {
  description = <<EOT
Map of log_analytics_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - identity
Optional:
    - size_gb
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    size_gb             = optional(number)
    tags                = optional(map(string))
    identity            = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
  }))
}
