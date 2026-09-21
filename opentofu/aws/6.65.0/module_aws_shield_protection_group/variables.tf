variable "shield_protection_groups" {
  description = <<EOT
Map of shield_protection_groups, attributes below
Required:
    - aggregation
    - pattern
    - protection_group_id
Optional:
    - members
    - resource_type
    - tags
    - tags_all
EOT

  type = map(object({
    aggregation         = string
    pattern             = string
    protection_group_id = string
    members             = optional(list(string))
    resource_type       = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
