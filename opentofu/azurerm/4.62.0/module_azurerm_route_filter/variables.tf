variable "route_filters" {
  description = <<EOT
Map of route_filters, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - rule
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    rule                = optional(list(object({
            access = string
            communities = list(string)
            name = string
            rule_type = string
        })))
    tags                = optional(map(string))
  }))
}
