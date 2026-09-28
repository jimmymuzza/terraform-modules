variable "devopsguru_resource_collections" {
  description = <<EOT
Map of devopsguru_resource_collections, attributes below
Required:
    - type
Optional:
    - region
    - cloudformation
    - tags
EOT

  type = map(object({
    type           = string
    region         = optional(string)
    cloudformation = optional(list(object({
            stack_names = list(string)
        })))
    tags           = optional(list(object({
            app_boundary_key = string
            tag_values       = list(string)
        })))
  }))
}
