variable "oam_sinks" {
  description = <<EOT
Map of oam_sinks, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name     = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
