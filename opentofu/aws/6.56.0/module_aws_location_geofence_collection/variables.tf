variable "location_geofence_collections" {
  description = <<EOT
Map of location_geofence_collections, attributes below
Required:
    - collection_name
Optional:
    - description
    - kms_key_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    collection_name = string
    description     = optional(string)
    kms_key_id      = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
