variable "appmesh_virtual_services" {
  description = <<EOT
Map of appmesh_virtual_services, attributes below
Required:
    - mesh_name
    - name
    - spec
Optional:
    - mesh_owner
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    mesh_name  = string
    name       = string
    mesh_owner = optional(string)
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
    spec       = list(object({
            provider = optional(list(object({
                virtual_node   = optional(list(object({
                    virtual_node_name = string
                })))
                virtual_router = optional(list(object({
                    virtual_router_name = string
                })))
            })))
        }))
  }))
}
