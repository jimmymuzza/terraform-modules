variable "storage_movers" {
  description = <<EOT
Map of storage_movers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    tags                = optional(map(string))
  }))
}
