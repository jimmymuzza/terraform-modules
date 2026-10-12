variable "oracle_autonomous_database_cross_region_disaster_recoveries" {
  description = <<EOT
Map of oracle_autonomous_database_cross_region_disaster_recoveries, attributes below
Required:
    - display_name
    - location
    - name
    - resource_group_name
    - source_autonomous_database_id
    - subnet_id
Optional:
    - replicate_automatic_backups_enabled
    - tags
EOT

  type = map(object({
    display_name                        = string
    location                            = string
    name                                = string
    resource_group_name                 = string
    source_autonomous_database_id       = string
    subnet_id                           = string
    replicate_automatic_backups_enabled = optional(bool)
    tags                                = optional(map(string))
  }))
}
