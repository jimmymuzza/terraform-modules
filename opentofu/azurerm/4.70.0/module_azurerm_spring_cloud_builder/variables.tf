variable "spring_cloud_builders" {
  description = <<EOT
Map of spring_cloud_builders, attributes below
Required:
    - name
    - spring_cloud_service_id
    - build_pack_group
    - stack
EOT

  type = map(object({
    name                    = string
    spring_cloud_service_id = string
    build_pack_group        = set(object({
            name           = string
            build_pack_ids = optional(list(string))
        }))
    stack                   = list(object({
            version = string
        }))
  }))
}
