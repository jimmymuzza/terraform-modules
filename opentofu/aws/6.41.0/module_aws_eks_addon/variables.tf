variable "eks_addons" {
  description = <<EOT
Map of eks_addons, attributes below
Required:
    - addon_name
    - cluster_name
Optional:
    - addon_version
    - configuration_values
    - preserve
    - region
    - resolve_conflicts_on_create
    - resolve_conflicts_on_update
    - service_account_role_arn
    - tags
    - tags_all
    - pod_identity_association
EOT

  type = map(object({
    addon_name                  = string
    cluster_name                = string
    addon_version               = optional(string)
    configuration_values        = optional(string)
    preserve                    = optional(bool)
    region                      = optional(string)
    resolve_conflicts_on_create = optional(string)
    resolve_conflicts_on_update = optional(string)
    service_account_role_arn    = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    pod_identity_association    = optional(set(object({
            role_arn        = string
            service_account = string
        })))
  }))
}
