resource "aws_mq_broker" "mq_brokers" {
  for_each = var.mq_brokers

  broker_name                         = each.value.broker_name
  engine_type                         = each.value.engine_type
  engine_version                      = each.value.engine_version
  host_instance_type                  = each.value.host_instance_type
  apply_immediately                   = each.value.apply_immediately
  authentication_strategy             = each.value.authentication_strategy
  auto_minor_version_upgrade          = each.value.auto_minor_version_upgrade
  data_replication_mode               = each.value.data_replication_mode
  data_replication_primary_broker_arn = each.value.data_replication_primary_broker_arn
  deployment_mode                     = each.value.deployment_mode
  publicly_accessible                 = each.value.publicly_accessible
  region                              = each.value.region
  resource_share_arns                 = each.value.resource_share_arns
  security_groups                     = each.value.security_groups
  storage_type                        = each.value.storage_type
  subnet_ids                          = each.value.subnet_ids
  tags                                = each.value.tags
  tags_all                            = each.value.tags_all

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      revision = configuration.value.revision
    }
  }

  dynamic "encryption_options" {
    for_each = each.value.encryption_options != null ? each.value.encryption_options : []
    content {
      kms_key_id        = encryption_options.value.kms_key_id
      use_aws_owned_key = encryption_options.value.use_aws_owned_key
    }
  }

  dynamic "ldap_server_metadata" {
    for_each = each.value.ldap_server_metadata != null ? each.value.ldap_server_metadata : []
    content {
      hosts                    = ldap_server_metadata.value.hosts
      role_base                = ldap_server_metadata.value.role_base
      role_name                = ldap_server_metadata.value.role_name
      role_search_matching     = ldap_server_metadata.value.role_search_matching
      role_search_subtree      = ldap_server_metadata.value.role_search_subtree
      service_account_password = ldap_server_metadata.value.service_account_password
      service_account_username = ldap_server_metadata.value.service_account_username
      user_base                = ldap_server_metadata.value.user_base
      user_role_name           = ldap_server_metadata.value.user_role_name
      user_search_matching     = ldap_server_metadata.value.user_search_matching
      user_search_subtree      = ldap_server_metadata.value.user_search_subtree
    }
  }

  dynamic "logs" {
    for_each = each.value.logs != null ? each.value.logs : []
    content {
      audit   = logs.value.audit
      general = logs.value.general
    }
  }

  dynamic "maintenance_window_start_time" {
    for_each = each.value.maintenance_window_start_time != null ? each.value.maintenance_window_start_time : []
    content {
      day_of_week = maintenance_window_start_time.value.day_of_week
      time_of_day = maintenance_window_start_time.value.time_of_day
      time_zone   = maintenance_window_start_time.value.time_zone
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? each.value.user : []
    content {
      password         = user.value.password
      username         = user.value.username
      console_access   = user.value.console_access
      groups           = user.value.groups
      replication_user = user.value.replication_user
    }
  }
}
