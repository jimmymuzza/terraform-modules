variable "organizations_policies" {
  description = <<EOT
Map of organizations_policies, attributes below
Required:
    - content
    - name
Optional:
    - description
    - skip_destroy
    - tags
    - tags_all
    - type
EOT

  type = map(object({
    content      = string
    name         = string
    description  = optional(string)
    skip_destroy = optional(bool)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    type         = optional(string)
  }))
}
