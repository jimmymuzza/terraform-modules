variable "organizations_resource_policies" {
  description = <<EOT
Map of organizations_resource_policies, attributes below
Required:
    - content
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    content  = string
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
