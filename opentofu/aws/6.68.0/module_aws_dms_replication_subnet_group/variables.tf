variable "dms_replication_subnet_groups" {
  description = <<EOT
Map of dms_replication_subnet_groups, attributes below
Required:
    - replication_subnet_group_description
    - replication_subnet_group_id
    - subnet_ids
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    replication_subnet_group_description = string
    replication_subnet_group_id          = string
    subnet_ids                           = set(string)
    region                               = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
  }))
}
