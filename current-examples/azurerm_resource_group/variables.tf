variable "resource_groups" {
  description = <<EOT
Map of resource_groups, attributes below
Required:
    - location
    - name
Optional:
    - managed_by
    - tags
EOT

  type = map(object({
    location   = string
    name       = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

