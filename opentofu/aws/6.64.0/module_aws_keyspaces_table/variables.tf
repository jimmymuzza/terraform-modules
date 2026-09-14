variable "keyspaces_tables" {
  description = <<EOT
Map of keyspaces_tables, attributes below
Required:
    - keyspace_name
    - table_name
    - schema_definition
Optional:
    - default_time_to_live
    - region
    - tags
    - tags_all
    - capacity_specification
    - client_side_timestamps
    - comment
    - encryption_specification
    - point_in_time_recovery
    - ttl
EOT

  type = map(object({
    keyspace_name            = string
    table_name               = string
    default_time_to_live     = optional(number)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    capacity_specification   = optional(list(object({
            read_capacity_units  = optional(number)
            throughput_mode      = optional(string)
            write_capacity_units = optional(number)
        })))
    client_side_timestamps   = optional(list(object({
            status = string
        })))
    comment                  = optional(list(object({
            message = optional(string)
        })))
    encryption_specification = optional(list(object({
            kms_key_identifier = optional(string)
            type               = optional(string)
        })))
    point_in_time_recovery   = optional(list(object({
            status = optional(string)
        })))
    schema_definition        = list(object({
            clustering_key = optional(list(object({
                name     = string
                order_by = string
            })))
            column         = set(object({
                name = string
                type = string
            }))
            partition_key  = list(object({
                name = string
            }))
            static_column  = optional(set(object({
                name = string
            })))
        }))
    ttl                      = optional(list(object({
            status = string
        })))
  }))
}
