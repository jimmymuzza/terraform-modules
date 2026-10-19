variable "shield_protections" {
  description = <<EOT
Map of shield_protections, attributes below
Required:
    - name
    - resource_arn
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    name         = string
    resource_arn = string
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
