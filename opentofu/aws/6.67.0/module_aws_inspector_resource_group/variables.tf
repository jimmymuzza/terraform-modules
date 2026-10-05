variable "inspector_resource_groups" {
  description = <<EOT
Map of inspector_resource_groups, attributes below
Required:
    - tags
Optional:
    - region
EOT

  type = map(object({
    tags   = map(string)
    region = optional(string)
  }))
}
