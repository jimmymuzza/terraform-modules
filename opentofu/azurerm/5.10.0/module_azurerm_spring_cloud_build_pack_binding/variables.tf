variable "spring_cloud_build_pack_bindings" {
  description = <<EOT
Map of spring_cloud_build_pack_bindings, attributes below
Required:
    - name
    - spring_cloud_builder_id
Optional:
    - binding_type
    - launch
EOT

  type = map(object({
    name                    = string
    spring_cloud_builder_id = string
    binding_type            = optional(string)
    launch                  = optional(list(object({
            properties = optional(map(string))
            secrets    = optional(map(string))
        })))
  }))
}
