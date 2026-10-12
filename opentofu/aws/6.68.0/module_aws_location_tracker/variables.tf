variable "location_trackers" {
  description = <<EOT
Map of location_trackers, attributes below
Required:
    - tracker_name
Optional:
    - description
    - kms_key_id
    - position_filtering
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    tracker_name       = string
    description        = optional(string)
    kms_key_id         = optional(string)
    position_filtering = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
