variable "chime_voice_connectors" {
  description = <<EOT
Map of chime_voice_connectors, attributes below
Required:
    - name
    - require_encryption
Optional:
    - aws_region
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name               = string
    require_encryption = bool
    aws_region         = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
