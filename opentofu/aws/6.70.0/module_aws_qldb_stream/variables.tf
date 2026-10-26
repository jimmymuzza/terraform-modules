variable "qldb_streams" {
  description = <<EOT
Map of qldb_streams, attributes below
Required:
    - inclusive_start_time
    - ledger_name
    - role_arn
    - stream_name
    - kinesis_configuration
Optional:
    - exclusive_end_time
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    inclusive_start_time  = string
    ledger_name           = string
    role_arn              = string
    stream_name           = string
    exclusive_end_time    = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    kinesis_configuration = list(object({
            stream_arn          = string
            aggregation_enabled = optional(bool)
        }))
  }))
}
