variable "appmesh_virtual_routers" {
  description = <<EOT
Map of appmesh_virtual_routers, attributes below
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
            listener = optional(list(object({
                port_mapping = list(object({
                    port     = number
                    protocol = string
                }))
            })))
        }))
  }))
}
