variable "dms_replication_configs" {
  description = <<EOT
Map of dms_replication_configs, attributes below
Required:
    - replication_config_identifier
    - replication_type
    - source_endpoint_arn
    - table_mappings
    - target_endpoint_arn
    - compute_config
Optional:
    - region
    - replication_settings
    - resource_identifier
    - start_replication
    - supplemental_settings
    - tags
    - tags_all
EOT

  type = map(object({
    replication_config_identifier = string
    replication_type              = string
    source_endpoint_arn           = string
    table_mappings                = string
    target_endpoint_arn           = string
    region                        = optional(string)
    replication_settings          = optional(string)
    resource_identifier           = optional(string)
    start_replication             = optional(bool)
    supplemental_settings         = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    compute_config                = list(object({
            replication_subnet_group_id  = string
            availability_zone            = optional(string)
            dns_name_servers             = optional(string)
            kms_key_id                   = optional(string)
            max_capacity_units           = optional(number)
            min_capacity_units           = optional(number)
            multi_az                     = optional(bool)
            preferred_maintenance_window = optional(string)
            vpc_security_group_ids       = optional(set(string))
        }))
  }))
}
