variable "management_groups" {
  description = <<EOT
Map of management_groups, attributes below
Optional:
    - display_name
    - name
    - parent_management_group_id
    - subscription_ids
EOT

  type = map(object({
    display_name               = optional(string)
    name                       = optional(string)
    parent_management_group_id = optional(string)
    subscription_ids           = optional(set(string))
  }))
}

