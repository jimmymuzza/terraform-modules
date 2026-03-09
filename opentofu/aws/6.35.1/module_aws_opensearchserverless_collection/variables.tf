variable "opensearchserverless_collections" {
  description = <<EOT
Map of opensearchserverless_collections, attributes below
Required:
    - name
Optional:
    - description
    - region
    - standby_replicas
    - tags
    - type
EOT

  type = map(object({
    name             = string
    description      = optional(string)
    region           = optional(string)
    standby_replicas = optional(string)
    tags             = optional(map(string))
    type             = optional(string)
  }))
}
