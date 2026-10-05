variable "dynamodb_kinesis_streaming_destinations" {
  description = <<EOT
Map of dynamodb_kinesis_streaming_destinations, attributes below
Required:
    - stream_arn
    - table_name
Optional:
    - approximate_creation_date_time_precision
    - region
EOT

  type = map(object({
    stream_arn                               = string
    table_name                               = string
    approximate_creation_date_time_precision = optional(string)
    region                                   = optional(string)
  }))
}
