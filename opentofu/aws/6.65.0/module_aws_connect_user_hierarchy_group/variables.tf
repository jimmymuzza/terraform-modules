variable "connect_user_hierarchy_groups" {
  description = <<EOT
Map of connect_user_hierarchy_groups, attributes below
Required:
    - instance_id
    - name
Optional:
    - parent_group_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_id     = string
    name            = string
    parent_group_id = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
