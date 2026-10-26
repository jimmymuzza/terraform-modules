variable "media_packagev2_channel_groups" {
  description = <<EOT
Map of media_packagev2_channel_groups, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
