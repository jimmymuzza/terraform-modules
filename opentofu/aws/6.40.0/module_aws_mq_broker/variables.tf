variable "mq_brokers" {
  description = <<EOT
Map of mq_brokers, attributes below
Required:
    - broker_name
    - engine_type
    - engine_version
    - host_instance_type
Optional:
    - apply_immediately
    - authentication_strategy
    - auto_minor_version_upgrade
    - data_replication_mode
    - data_replication_primary_broker_arn
    - deployment_mode
    - publicly_accessible
    - region
    - security_groups
    - storage_type
    - subnet_ids
    - tags
    - tags_all
    - configuration
    - encryption_options
    - ldap_server_metadata
    - logs
    - maintenance_window_start_time
    - user
EOT

  type = map(object({
    broker_name                         = string
    engine_type                         = string
    engine_version                      = string
    host_instance_type                  = string
    apply_immediately                   = optional(bool)
    authentication_strategy             = optional(string)
    auto_minor_version_upgrade          = optional(bool)
    data_replication_mode               = optional(string)
    data_replication_primary_broker_arn = optional(string)
    deployment_mode                     = optional(string)
    publicly_accessible                 = optional(bool)
    region                              = optional(string)
    security_groups                     = optional(set(string))
    storage_type                        = optional(string)
    subnet_ids                          = optional(set(string))
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    configuration                       = optional(list(object({
            revision = optional(number)
        })))
    encryption_options                  = optional(list(object({
            kms_key_id        = optional(string)
            use_aws_owned_key = optional(bool)
        })))
    ldap_server_metadata                = optional(list(object({
            hosts                    = optional(list(string))
            role_base                = optional(string)
            role_name                = optional(string)
            role_search_matching     = optional(string)
            role_search_subtree      = optional(bool)
            service_account_password = optional(string)
            service_account_username = optional(string)
            user_base                = optional(string)
            user_role_name           = optional(string)
            user_search_matching     = optional(string)
            user_search_subtree      = optional(bool)
        })))
    logs                                = optional(list(object({
            audit   = optional(string)
            general = optional(bool)
        })))
    maintenance_window_start_time       = optional(list(object({
            day_of_week = string
            time_of_day = string
            time_zone   = string
        })))
    user                                = optional(set(object({
            password         = string
            username         = string
            console_access   = optional(bool)
            groups           = optional(set(string))
            replication_user = optional(bool)
        })))
  }))
}
