variable "finspace_kx_dataviews" {
  description = <<EOT
Map of finspace_kx_dataviews, attributes below
Required:
    - auto_update
    - az_mode
    - database_name
    - environment_id
    - name
Optional:
    - availability_zone_id
    - changeset_id
    - description
    - read_write
    - region
    - tags
    - tags_all
    - segment_configurations
EOT

  type = map(object({
    auto_update            = bool
    az_mode                = string
    database_name          = string
    environment_id         = string
    name                   = string
    availability_zone_id   = optional(string)
    changeset_id           = optional(string)
    description            = optional(string)
    read_write             = optional(bool)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    segment_configurations = optional(list(object({
            db_paths    = list(string)
            volume_name = string
            on_demand   = optional(bool)
        })))
  }))
}
