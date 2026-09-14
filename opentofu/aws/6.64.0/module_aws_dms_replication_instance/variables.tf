variable "dms_replication_instances" {
  description = <<EOT
Map of dms_replication_instances, attributes below
Required:
    - replication_instance_class
    - replication_instance_id
Optional:
    - allocated_storage
    - allow_major_version_upgrade
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - dns_name_servers
    - engine_version
    - kms_key_arn
    - multi_az
    - network_type
    - preferred_maintenance_window
    - publicly_accessible
    - region
    - replication_subnet_group_id
    - tags
    - tags_all
    - vpc_security_group_ids
    - kerberos_authentication_settings
EOT

  type = map(object({
    replication_instance_class       = string
    replication_instance_id          = string
    allocated_storage                = optional(number)
    allow_major_version_upgrade      = optional(bool)
    apply_immediately                = optional(bool)
    auto_minor_version_upgrade       = optional(bool)
    availability_zone                = optional(string)
    dns_name_servers                 = optional(string)
    engine_version                   = optional(string)
    kms_key_arn                      = optional(string)
    multi_az                         = optional(bool)
    network_type                     = optional(string)
    preferred_maintenance_window     = optional(string)
    publicly_accessible              = optional(bool)
    region                           = optional(string)
    replication_subnet_group_id      = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    vpc_security_group_ids           = optional(set(string))
    kerberos_authentication_settings = optional(list(object({
            key_cache_secret_iam_arn = string
            key_cache_secret_id      = string
            krb5_file_contents       = string
        })))
  }))
}
