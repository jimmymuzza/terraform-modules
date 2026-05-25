variable "dms_endpoints" {
  description = <<EOT
Map of dms_endpoints, attributes below
Required:
    - endpoint_id
    - endpoint_type
    - engine_name
Optional:
    - certificate_arn
    - database_name
    - extra_connection_attributes
    - kms_key_arn
    - password
    - pause_replication_tasks
    - port
    - region
    - secrets_manager_access_role_arn
    - secrets_manager_arn
    - server_name
    - service_access_role
    - ssl_mode
    - tags
    - tags_all
    - username
    - elasticsearch_settings
    - kafka_settings
    - kinesis_settings
    - mongodb_settings
    - mysql_settings
    - oracle_settings
    - postgres_settings
    - redis_settings
    - redshift_settings
EOT

  type = map(object({
    endpoint_id                     = string
    endpoint_type                   = string
    engine_name                     = string
    certificate_arn                 = optional(string)
    database_name                   = optional(string)
    extra_connection_attributes     = optional(string)
    kms_key_arn                     = optional(string)
    password                        = optional(string)
    pause_replication_tasks         = optional(bool)
    port                            = optional(number)
    region                          = optional(string)
    secrets_manager_access_role_arn = optional(string)
    secrets_manager_arn             = optional(string)
    server_name                     = optional(string)
    service_access_role             = optional(string)
    ssl_mode                        = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    username                        = optional(string)
    elasticsearch_settings          = optional(list(object({
            endpoint_uri               = string
            service_access_role_arn    = string
            error_retry_duration       = optional(number)
            full_load_error_percentage = optional(number)
            use_new_mapping_type       = optional(bool)
        })))
    kafka_settings                  = optional(list(object({
            broker                         = string
            include_control_details        = optional(bool)
            include_null_and_empty         = optional(bool)
            include_partition_value        = optional(bool)
            include_table_alter_operations = optional(bool)
            include_transaction_details    = optional(bool)
            message_format                 = optional(string)
            message_max_bytes              = optional(number)
            no_hex_prefix                  = optional(bool)
            partition_include_schema_table = optional(bool)
            sasl_mechanism                 = optional(string)
            sasl_password                  = optional(string)
            sasl_username                  = optional(string)
            security_protocol              = optional(string)
            ssl_ca_certificate_arn         = optional(string)
            ssl_client_certificate_arn     = optional(string)
            ssl_client_key_arn             = optional(string)
            ssl_client_key_password        = optional(string)
            topic                          = optional(string)
        })))
    kinesis_settings                = optional(list(object({
            include_control_details        = optional(bool)
            include_null_and_empty         = optional(bool)
            include_partition_value        = optional(bool)
            include_table_alter_operations = optional(bool)
            include_transaction_details    = optional(bool)
            message_format                 = optional(string)
            partition_include_schema_table = optional(bool)
            service_access_role_arn        = optional(string)
            stream_arn                     = optional(string)
            use_large_integer_value        = optional(bool)
        })))
    mongodb_settings                = optional(list(object({
            auth_mechanism      = optional(string)
            auth_source         = optional(string)
            auth_type           = optional(string)
            docs_to_investigate = optional(string)
            extract_doc_id      = optional(string)
            nesting_level       = optional(string)
            use_update_lookup   = optional(bool)
        })))
    mysql_settings                  = optional(list(object({
            after_connect_script              = optional(string)
            authentication_method             = optional(string)
            clean_source_metadata_on_mismatch = optional(bool)
            events_poll_interval              = optional(number)
            execute_timeout                   = optional(number)
            max_file_size                     = optional(number)
            parallel_load_threads             = optional(number)
            server_timezone                   = optional(string)
            service_access_role_arn           = optional(string)
            target_db_type                    = optional(string)
        })))
    oracle_settings                 = optional(list(object({
            access_alternate_directly                     = optional(bool)
            add_supplemental_logging                      = optional(bool)
            additional_archived_log_dest_id               = optional(number)
            allow_selected_nested_tables                  = optional(bool)
            archived_log_dest_id                          = optional(number)
            archived_logs_only                            = optional(bool)
            asm_password                                  = optional(string)
            asm_server                                    = optional(string)
            asm_user                                      = optional(string)
            authentication_method                         = optional(string)
            char_length_semantics                         = optional(string)
            convert_timestamp_with_zone_to_utc            = optional(bool)
            direct_path_no_log                            = optional(bool)
            direct_path_parallel_load                     = optional(bool)
            enable_homogenous_tablespace                  = optional(bool)
            extra_archived_log_dest_ids                   = optional(list(number))
            fail_task_on_lob_truncation                   = optional(bool)
            number_datatype_scale                         = optional(number)
            open_transaction_window                       = optional(number)
            oracle_path_prefix                            = optional(string)
            parallel_asm_read_threads                     = optional(number)
            read_ahead_blocks                             = optional(number)
            read_table_space_name                         = optional(bool)
            replace_path_prefix                           = optional(bool)
            retry_interval                                = optional(number)
            secrets_manager_oracle_asm_access_role_arn    = optional(string)
            secrets_manager_oracle_asm_secret_id          = optional(string)
            security_db_encryption                        = optional(string)
            security_db_encryption_name                   = optional(string)
            spatial_data_option_to_geo_json_function_name = optional(string)
            standby_delay_time                            = optional(number)
            trim_space_in_char                            = optional(bool)
            use_alternate_folder_for_online               = optional(bool)
            use_bfile                                     = optional(bool)
            use_direct_path_full_load                     = optional(bool)
            use_logminer_reader                           = optional(bool)
            use_path_prefix                               = optional(string)
        })))
    postgres_settings               = optional(list(object({
            after_connect_script         = optional(string)
            authentication_method        = optional(string)
            babelfish_database_name      = optional(string)
            capture_ddls                 = optional(bool)
            database_mode                = optional(string)
            ddl_artifacts_schema         = optional(string)
            execute_timeout              = optional(number)
            fail_tasks_on_lob_truncation = optional(bool)
            heartbeat_enable             = optional(bool)
            heartbeat_frequency          = optional(number)
            heartbeat_schema             = optional(string)
            map_boolean_as_boolean       = optional(bool)
            map_jsonb_as_clob            = optional(bool)
            map_long_varchar_as          = optional(string)
            max_file_size                = optional(number)
            plugin_name                  = optional(string)
            service_access_role_arn      = optional(string)
            slot_name                    = optional(string)
        })))
    redis_settings                  = optional(list(object({
            auth_type              = string
            port                   = number
            server_name            = string
            auth_password          = optional(string)
            auth_user_name         = optional(string)
            ssl_ca_certificate_arn = optional(string)
            ssl_security_protocol  = optional(string)
        })))
    redshift_settings               = optional(list(object({
            bucket_folder                     = optional(string)
            bucket_name                       = optional(string)
            encryption_mode                   = optional(string)
            server_side_encryption_kms_key_id = optional(string)
            service_access_role_arn           = optional(string)
        })))
  }))
}
