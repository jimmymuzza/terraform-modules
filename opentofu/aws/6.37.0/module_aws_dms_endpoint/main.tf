resource "aws_dms_endpoint" "dms_endpoints" {
  for_each = var.dms_endpoints

  endpoint_id                     = each.value.endpoint_id
  endpoint_type                   = each.value.endpoint_type
  engine_name                     = each.value.engine_name
  certificate_arn                 = each.value.certificate_arn
  database_name                   = each.value.database_name
  extra_connection_attributes     = each.value.extra_connection_attributes
  kms_key_arn                     = each.value.kms_key_arn
  password                        = each.value.password
  pause_replication_tasks         = each.value.pause_replication_tasks
  port                            = each.value.port
  region                          = each.value.region
  secrets_manager_access_role_arn = each.value.secrets_manager_access_role_arn
  secrets_manager_arn             = each.value.secrets_manager_arn
  server_name                     = each.value.server_name
  service_access_role             = each.value.service_access_role
  ssl_mode                        = each.value.ssl_mode
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  username                        = each.value.username

  dynamic "elasticsearch_settings" {
    for_each = each.value.elasticsearch_settings != null ? each.value.elasticsearch_settings : []
    content {
      endpoint_uri               = elasticsearch_settings.value.endpoint_uri
      service_access_role_arn    = elasticsearch_settings.value.service_access_role_arn
      error_retry_duration       = elasticsearch_settings.value.error_retry_duration
      full_load_error_percentage = elasticsearch_settings.value.full_load_error_percentage
      use_new_mapping_type       = elasticsearch_settings.value.use_new_mapping_type
    }
  }

  dynamic "kafka_settings" {
    for_each = each.value.kafka_settings != null ? each.value.kafka_settings : []
    content {
      broker                         = kafka_settings.value.broker
      include_control_details        = kafka_settings.value.include_control_details
      include_null_and_empty         = kafka_settings.value.include_null_and_empty
      include_partition_value        = kafka_settings.value.include_partition_value
      include_table_alter_operations = kafka_settings.value.include_table_alter_operations
      include_transaction_details    = kafka_settings.value.include_transaction_details
      message_format                 = kafka_settings.value.message_format
      message_max_bytes              = kafka_settings.value.message_max_bytes
      no_hex_prefix                  = kafka_settings.value.no_hex_prefix
      partition_include_schema_table = kafka_settings.value.partition_include_schema_table
      sasl_mechanism                 = kafka_settings.value.sasl_mechanism
      sasl_password                  = kafka_settings.value.sasl_password
      sasl_username                  = kafka_settings.value.sasl_username
      security_protocol              = kafka_settings.value.security_protocol
      ssl_ca_certificate_arn         = kafka_settings.value.ssl_ca_certificate_arn
      ssl_client_certificate_arn     = kafka_settings.value.ssl_client_certificate_arn
      ssl_client_key_arn             = kafka_settings.value.ssl_client_key_arn
      ssl_client_key_password        = kafka_settings.value.ssl_client_key_password
      topic                          = kafka_settings.value.topic
    }
  }

  dynamic "kinesis_settings" {
    for_each = each.value.kinesis_settings != null ? each.value.kinesis_settings : []
    content {
      include_control_details        = kinesis_settings.value.include_control_details
      include_null_and_empty         = kinesis_settings.value.include_null_and_empty
      include_partition_value        = kinesis_settings.value.include_partition_value
      include_table_alter_operations = kinesis_settings.value.include_table_alter_operations
      include_transaction_details    = kinesis_settings.value.include_transaction_details
      message_format                 = kinesis_settings.value.message_format
      partition_include_schema_table = kinesis_settings.value.partition_include_schema_table
      service_access_role_arn        = kinesis_settings.value.service_access_role_arn
      stream_arn                     = kinesis_settings.value.stream_arn
      use_large_integer_value        = kinesis_settings.value.use_large_integer_value
    }
  }

  dynamic "mongodb_settings" {
    for_each = each.value.mongodb_settings != null ? each.value.mongodb_settings : []
    content {
      auth_mechanism      = mongodb_settings.value.auth_mechanism
      auth_source         = mongodb_settings.value.auth_source
      auth_type           = mongodb_settings.value.auth_type
      docs_to_investigate = mongodb_settings.value.docs_to_investigate
      extract_doc_id      = mongodb_settings.value.extract_doc_id
      nesting_level       = mongodb_settings.value.nesting_level
      use_update_lookup   = mongodb_settings.value.use_update_lookup
    }
  }

  dynamic "mysql_settings" {
    for_each = each.value.mysql_settings != null ? each.value.mysql_settings : []
    content {
      after_connect_script              = mysql_settings.value.after_connect_script
      authentication_method             = mysql_settings.value.authentication_method
      clean_source_metadata_on_mismatch = mysql_settings.value.clean_source_metadata_on_mismatch
      events_poll_interval              = mysql_settings.value.events_poll_interval
      execute_timeout                   = mysql_settings.value.execute_timeout
      max_file_size                     = mysql_settings.value.max_file_size
      parallel_load_threads             = mysql_settings.value.parallel_load_threads
      server_timezone                   = mysql_settings.value.server_timezone
      service_access_role_arn           = mysql_settings.value.service_access_role_arn
      target_db_type                    = mysql_settings.value.target_db_type
    }
  }

  dynamic "oracle_settings" {
    for_each = each.value.oracle_settings != null ? each.value.oracle_settings : []
    content {
      access_alternate_directly                     = oracle_settings.value.access_alternate_directly
      add_supplemental_logging                      = oracle_settings.value.add_supplemental_logging
      additional_archived_log_dest_id               = oracle_settings.value.additional_archived_log_dest_id
      allow_selected_nested_tables                  = oracle_settings.value.allow_selected_nested_tables
      archived_log_dest_id                          = oracle_settings.value.archived_log_dest_id
      archived_logs_only                            = oracle_settings.value.archived_logs_only
      asm_password                                  = oracle_settings.value.asm_password
      asm_server                                    = oracle_settings.value.asm_server
      asm_user                                      = oracle_settings.value.asm_user
      authentication_method                         = oracle_settings.value.authentication_method
      char_length_semantics                         = oracle_settings.value.char_length_semantics
      convert_timestamp_with_zone_to_utc            = oracle_settings.value.convert_timestamp_with_zone_to_utc
      direct_path_no_log                            = oracle_settings.value.direct_path_no_log
      direct_path_parallel_load                     = oracle_settings.value.direct_path_parallel_load
      enable_homogenous_tablespace                  = oracle_settings.value.enable_homogenous_tablespace
      extra_archived_log_dest_ids                   = oracle_settings.value.extra_archived_log_dest_ids
      fail_task_on_lob_truncation                   = oracle_settings.value.fail_task_on_lob_truncation
      number_datatype_scale                         = oracle_settings.value.number_datatype_scale
      open_transaction_window                       = oracle_settings.value.open_transaction_window
      oracle_path_prefix                            = oracle_settings.value.oracle_path_prefix
      parallel_asm_read_threads                     = oracle_settings.value.parallel_asm_read_threads
      read_ahead_blocks                             = oracle_settings.value.read_ahead_blocks
      read_table_space_name                         = oracle_settings.value.read_table_space_name
      replace_path_prefix                           = oracle_settings.value.replace_path_prefix
      retry_interval                                = oracle_settings.value.retry_interval
      secrets_manager_oracle_asm_access_role_arn    = oracle_settings.value.secrets_manager_oracle_asm_access_role_arn
      secrets_manager_oracle_asm_secret_id          = oracle_settings.value.secrets_manager_oracle_asm_secret_id
      security_db_encryption                        = oracle_settings.value.security_db_encryption
      security_db_encryption_name                   = oracle_settings.value.security_db_encryption_name
      spatial_data_option_to_geo_json_function_name = oracle_settings.value.spatial_data_option_to_geo_json_function_name
      standby_delay_time                            = oracle_settings.value.standby_delay_time
      trim_space_in_char                            = oracle_settings.value.trim_space_in_char
      use_alternate_folder_for_online               = oracle_settings.value.use_alternate_folder_for_online
      use_bfile                                     = oracle_settings.value.use_bfile
      use_direct_path_full_load                     = oracle_settings.value.use_direct_path_full_load
      use_logminer_reader                           = oracle_settings.value.use_logminer_reader
      use_path_prefix                               = oracle_settings.value.use_path_prefix
    }
  }

  dynamic "postgres_settings" {
    for_each = each.value.postgres_settings != null ? each.value.postgres_settings : []
    content {
      after_connect_script         = postgres_settings.value.after_connect_script
      authentication_method        = postgres_settings.value.authentication_method
      babelfish_database_name      = postgres_settings.value.babelfish_database_name
      capture_ddls                 = postgres_settings.value.capture_ddls
      database_mode                = postgres_settings.value.database_mode
      ddl_artifacts_schema         = postgres_settings.value.ddl_artifacts_schema
      execute_timeout              = postgres_settings.value.execute_timeout
      fail_tasks_on_lob_truncation = postgres_settings.value.fail_tasks_on_lob_truncation
      heartbeat_enable             = postgres_settings.value.heartbeat_enable
      heartbeat_frequency          = postgres_settings.value.heartbeat_frequency
      heartbeat_schema             = postgres_settings.value.heartbeat_schema
      map_boolean_as_boolean       = postgres_settings.value.map_boolean_as_boolean
      map_jsonb_as_clob            = postgres_settings.value.map_jsonb_as_clob
      map_long_varchar_as          = postgres_settings.value.map_long_varchar_as
      max_file_size                = postgres_settings.value.max_file_size
      plugin_name                  = postgres_settings.value.plugin_name
      service_access_role_arn      = postgres_settings.value.service_access_role_arn
      slot_name                    = postgres_settings.value.slot_name
    }
  }

  dynamic "redis_settings" {
    for_each = each.value.redis_settings != null ? each.value.redis_settings : []
    content {
      auth_type              = redis_settings.value.auth_type
      port                   = redis_settings.value.port
      server_name            = redis_settings.value.server_name
      auth_password          = redis_settings.value.auth_password
      auth_user_name         = redis_settings.value.auth_user_name
      ssl_ca_certificate_arn = redis_settings.value.ssl_ca_certificate_arn
      ssl_security_protocol  = redis_settings.value.ssl_security_protocol
    }
  }

  dynamic "redshift_settings" {
    for_each = each.value.redshift_settings != null ? each.value.redshift_settings : []
    content {
      bucket_folder                     = redshift_settings.value.bucket_folder
      bucket_name                       = redshift_settings.value.bucket_name
      encryption_mode                   = redshift_settings.value.encryption_mode
      server_side_encryption_kms_key_id = redshift_settings.value.server_side_encryption_kms_key_id
      service_access_role_arn           = redshift_settings.value.service_access_role_arn
    }
  }
}
