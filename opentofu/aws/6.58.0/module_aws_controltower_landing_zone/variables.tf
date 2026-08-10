variable "controltower_landing_zones" {
  description = <<EOT
Map of controltower_landing_zones, attributes below
Required:
    - manifest_json
    - version
Optional:
    - region
    - remediation_types
    - tags
    - tags_all
EOT

  type = map(object({
    manifest_json     = string
    version           = string
    region            = optional(string)
    remediation_types = optional(set(string))
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
