variable "dms_s3_endpoints" {
  description = <<EOT
Map of dms_s3_endpoints, attributes below
Required:
    - bucket_name
    - endpoint_id
    - endpoint_type
    - service_access_role_arn
Optional:
    - add_column_name
    - add_trailing_padding_character
    - bucket_folder
    - canned_acl_for_objects
    - cdc_inserts_and_updates
    - cdc_inserts_only
    - cdc_max_batch_interval
    - cdc_min_file_size
    - cdc_path
    - certificate_arn
    - compression_type
    - csv_delimiter
    - csv_no_sup_value
    - csv_null_value
    - csv_row_delimiter
    - data_format
    - data_page_size
    - date_partition_delimiter
    - date_partition_enabled
    - date_partition_sequence
    - date_partition_timezone
    - detach_target_on_lob_lookup_failure_parquet
    - dict_page_size_limit
    - enable_statistics
    - encoding_type
    - encryption_mode
    - expected_bucket_owner
    - external_table_definition
    - glue_catalog_generation
    - ignore_header_rows
    - include_op_for_full_load
    - kms_key_arn
    - max_file_size
    - parquet_timestamp_in_millisecond
    - parquet_version
    - preserve_transactions
    - region
    - rfc_4180
    - row_group_length
    - server_side_encryption_kms_key_id
    - ssl_mode
    - tags
    - tags_all
    - timestamp_column_name
    - use_csv_no_sup_value
    - use_task_start_time_for_full_load_timestamp
EOT

  type = map(object({
    bucket_name                                 = string
    endpoint_id                                 = string
    endpoint_type                               = string
    service_access_role_arn                     = string
    add_column_name                             = optional(bool)
    add_trailing_padding_character              = optional(bool)
    bucket_folder                               = optional(string)
    canned_acl_for_objects                      = optional(string)
    cdc_inserts_and_updates                     = optional(bool)
    cdc_inserts_only                            = optional(bool)
    cdc_max_batch_interval                      = optional(number)
    cdc_min_file_size                           = optional(number)
    cdc_path                                    = optional(string)
    certificate_arn                             = optional(string)
    compression_type                            = optional(string)
    csv_delimiter                               = optional(string)
    csv_no_sup_value                            = optional(string)
    csv_null_value                              = optional(string)
    csv_row_delimiter                           = optional(string)
    data_format                                 = optional(string)
    data_page_size                              = optional(number)
    date_partition_delimiter                    = optional(string)
    date_partition_enabled                      = optional(bool)
    date_partition_sequence                     = optional(string)
    date_partition_timezone                     = optional(string)
    detach_target_on_lob_lookup_failure_parquet = optional(bool)
    dict_page_size_limit                        = optional(number)
    enable_statistics                           = optional(bool)
    encoding_type                               = optional(string)
    encryption_mode                             = optional(string)
    expected_bucket_owner                       = optional(string)
    external_table_definition                   = optional(string)
    glue_catalog_generation                     = optional(bool)
    ignore_header_rows                          = optional(number)
    include_op_for_full_load                    = optional(bool)
    kms_key_arn                                 = optional(string)
    max_file_size                               = optional(number)
    parquet_timestamp_in_millisecond            = optional(bool)
    parquet_version                             = optional(string)
    preserve_transactions                       = optional(bool)
    region                                      = optional(string)
    rfc_4180                                    = optional(bool)
    row_group_length                            = optional(number)
    server_side_encryption_kms_key_id           = optional(string)
    ssl_mode                                    = optional(string)
    tags                                        = optional(map(string))
    tags_all                                    = optional(map(string))
    timestamp_column_name                       = optional(string)
    use_csv_no_sup_value                        = optional(bool)
    use_task_start_time_for_full_load_timestamp = optional(bool)
  }))
}
