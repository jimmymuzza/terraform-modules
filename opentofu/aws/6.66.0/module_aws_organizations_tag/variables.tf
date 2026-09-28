variable "organizations_tags" {
  description = <<EOT
Map of organizations_tags, attributes below
Required:
    - key
    - resource_id
    - value
EOT

  type = map(object({
    key         = string
    resource_id = string
    value       = string
  }))
}
