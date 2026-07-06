variable "dynamodb_global_secondary_indexes" {
  description = <<EOT
Map of dynamodb_global_secondary_indexes, attributes below
Required:
    - index_name
    - table_name
Optional:
    - region
    - warm_throughput
    - key_schema
    - on_demand_throughput
    - projection
    - provisioned_throughput
EOT

  type = map(object({
    index_name             = string
    table_name             = string
    region                 = optional(string)
    warm_throughput        = optional(object({
            read_units_per_second = number
            write_units_per_second = number
        }))
    key_schema             = optional(list(object({
            attribute_name = string
            attribute_type = string
            key_type       = string
        })))
    on_demand_throughput   = optional(list(object({
            max_read_request_units  = optional(number)
            max_write_request_units = optional(number)
        })))
    projection             = optional(list(object({
            projection_type    = string
            non_key_attributes = optional(set(string))
        })))
    provisioned_throughput = optional(list(object({
            read_capacity_units  = optional(number)
            write_capacity_units = optional(number)
        })))
  }))
}
