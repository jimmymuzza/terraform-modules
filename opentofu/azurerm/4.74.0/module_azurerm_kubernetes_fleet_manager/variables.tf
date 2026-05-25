variable "kubernetes_fleet_managers" {
  description = <<EOT
Map of kubernetes_fleet_managers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - hub_profile
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    hub_profile         = optional(list(object({
            dns_prefix = string
        })))
  }))
}
