variable "fms_resource_sets" {
  description = <<EOT
Map of fms_resource_sets, attributes below
Optional:
    - region
    - tags
    - resource_set
EOT

  type = map(object({
    region       = optional(string)
    tags         = optional(map(string))
    resource_set = optional(list(object({
            name                = string
            description         = optional(string)
            resource_set_status = optional(string)
            resource_type_list  = optional(list(string))
            update_token        = optional(string)
        })))
  }))
}
