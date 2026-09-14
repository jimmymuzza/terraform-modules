variable "appmesh_meshes" {
  description = <<EOT
Map of appmesh_meshes, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - spec
EOT

  type = map(object({
    name     = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
    spec     = optional(list(object({
            egress_filter     = optional(list(object({
                type = optional(string)
            })))
            service_discovery = optional(list(object({
                ip_preference = optional(string)
            })))
        })))
  }))
}
