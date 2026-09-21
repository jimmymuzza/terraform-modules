variable "ip_groups" {
  description = <<EOT
Map of ip_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - cidrs
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    cidrs               = optional(set(string))
    tags                = optional(map(string))
  }))
}
