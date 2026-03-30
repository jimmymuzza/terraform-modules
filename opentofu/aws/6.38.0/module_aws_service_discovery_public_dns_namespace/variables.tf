variable "service_discovery_public_dns_namespaces" {
  description = <<EOT
Map of service_discovery_public_dns_namespaces, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
