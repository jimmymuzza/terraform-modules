variable "dynamodb_tables" {
  description = <<EOT
Map of dynamodb_tables, attributes below
Required:
    - name
Optional:
    - billing_mode
    - deletion_protection_enabled
    - hash_key
    - range_key
    - read_capacity
    - region
    - restore_date_time
    - restore_source_name
    - restore_source_table_arn
    - restore_to_latest_time
    - stream_enabled
    - stream_view_type
    - table_class
    - tags
    - tags_all
    - write_capacity
    - attribute
    - global_secondary_index
    - global_table_witness
    - import_table
    - local_secondary_index
    - on_demand_throughput
    - point_in_time_recovery
    - replica
    - server_side_encryption
    - ttl
    - warm_throughput
EOT

  type = map(object({
    name                        = string
    billing_mode                = optional(string)
    deletion_protection_enabled = optional(bool)
    hash_key                    = optional(string)
    range_key                   = optional(string)
    read_capacity               = optional(number)
    region                      = optional(string)
    restore_date_time           = optional(string)
    restore_source_name         = optional(string)
    restore_source_table_arn    = optional(string)
    restore_to_latest_time      = optional(bool)
    stream_enabled              = optional(bool)
    stream_view_type            = optional(string)
    table_class                 = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    write_capacity              = optional(number)
    attribute                   = optional(set(object({
            name = string
            type = string
        })))
    global_secondary_index      = optional(set(object({
            name                 = string
            projection_type      = string
            hash_key             = optional(string)
            non_key_attributes   = optional(set(string))
            range_key            = optional(string)
            read_capacity        = optional(number)
            write_capacity       = optional(number)
            key_schema           = optional(list(object({
                attribute_name = string
                key_type       = string
            })))
            on_demand_throughput = optional(list(object({
                max_read_request_units  = optional(number)
                max_write_request_units = optional(number)
            })))
            warm_throughput      = optional(list(object({
                read_units_per_second  = optional(number)
                write_units_per_second = optional(number)
            })))
        })))
    global_table_witness        = optional(list(object({
            region_name = optional(string)
        })))
    import_table                = optional(list(object({
            input_format           = string
            input_compression_type = optional(string)
            input_format_options   = optional(list(object({
                csv = optional(list(object({
                    delimiter   = optional(string)
                    header_list = optional(set(string))
                })))
            })))
            s3_bucket_source       = list(object({
                bucket       = string
                bucket_owner = optional(string)
                key_prefix   = optional(string)
            }))
        })))
    local_secondary_index       = optional(set(object({
            name               = string
            projection_type    = string
            range_key          = string
            non_key_attributes = optional(list(string))
        })))
    on_demand_throughput        = optional(list(object({
            max_read_request_units  = optional(number)
            max_write_request_units = optional(number)
        })))
    point_in_time_recovery      = optional(list(object({
            enabled                 = bool
            recovery_period_in_days = optional(number)
        })))
    replica                     = optional(set(object({
            region_name                 = string
            consistency_mode            = optional(string)
            deletion_protection_enabled = optional(bool)
            kms_key_arn                 = optional(string)
            point_in_time_recovery      = optional(bool)
            propagate_tags              = optional(bool)
        })))
    server_side_encryption      = optional(list(object({
            enabled     = bool
            kms_key_arn = optional(string)
        })))
    ttl                         = optional(list(object({
            attribute_name = optional(string)
            enabled        = optional(bool)
        })))
    warm_throughput             = optional(list(object({
            read_units_per_second  = optional(number)
            write_units_per_second = optional(number)
        })))
  }))
}
