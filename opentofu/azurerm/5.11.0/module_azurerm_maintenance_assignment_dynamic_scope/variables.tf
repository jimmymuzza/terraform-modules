variable "maintenance_assignment_dynamic_scopes" {
  description = <<EOT
Map of maintenance_assignment_dynamic_scopes, attributes below
Required:
    - maintenance_configuration_id
    - name
    - filter
EOT

  type = map(object({
    maintenance_configuration_id = string
    name                         = string
    filter                       = list(object({
            locations       = optional(list(string))
            os_types        = optional(list(string))
            resource_groups = optional(list(string))
            resource_types  = optional(list(string))
            tag_filter      = optional(string)
            tags            = optional(list(object({
                tag    = string
                values = list(string)
            })))
        }))
  }))
}
