variable "extended_custom_locations" {
  description = <<EOT
Map of extended_custom_locations, attributes below
Required:
    - cluster_extension_ids
    - host_resource_id
    - location
    - name
    - namespace
    - resource_group_name
Optional:
    - display_name
    - host_type
    - authentication
EOT

  type = map(object({
    cluster_extension_ids = list(string)
    host_resource_id      = string
    location              = string
    name                  = string
    namespace             = string
    resource_group_name   = string
    display_name          = optional(string)
    host_type             = optional(string)
    authentication        = optional(list(object({
            value = string
            type  = optional(string)
        })))
  }))
}
