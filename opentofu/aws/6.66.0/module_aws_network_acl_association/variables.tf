variable "network_acl_associations" {
  description = <<EOT
Map of network_acl_associations, attributes below
Required:
    - network_acl_id
    - subnet_id
Optional:
    - region
EOT

  type = map(object({
    network_acl_id = string
    subnet_id      = string
    region         = optional(string)
  }))
}
