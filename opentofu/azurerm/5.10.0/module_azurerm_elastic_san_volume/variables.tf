variable "elastic_san_volumes" {
  description = <<EOT
Map of elastic_san_volumes, attributes below
Required:
    - name
    - size_in_gib
    - volume_group_id
Optional:
    - create_source
EOT

  type = map(object({
    name            = string
    size_in_gib     = number
    volume_group_id = string
    create_source   = optional(list(object({
            source_id   = string
            source_type = string
        })))
  }))
}
