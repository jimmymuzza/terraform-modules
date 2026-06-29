variable "media_package_channels" {
  description = <<EOT
Map of media_package_channels, attributes below
Required:
    - channel_id
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    channel_id  = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
