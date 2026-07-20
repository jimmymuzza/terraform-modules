variable "flow_logs" {
  description = <<EOT
Map of flow_logs, attributes below
Optional:
    - deliver_cross_account_role
    - eni_id
    - iam_role_arn
    - log_destination
    - log_destination_type
    - log_format
    - max_aggregation_interval
    - region
    - regional_nat_gateway_id
    - subnet_id
    - tags
    - tags_all
    - traffic_type
    - transit_gateway_attachment_id
    - transit_gateway_id
    - vpc_id
    - destination_options
EOT

  type = map(object({
    deliver_cross_account_role    = optional(string)
    eni_id                        = optional(string)
    iam_role_arn                  = optional(string)
    log_destination               = optional(string)
    log_destination_type          = optional(string)
    log_format                    = optional(string)
    max_aggregation_interval      = optional(number)
    region                        = optional(string)
    regional_nat_gateway_id       = optional(string)
    subnet_id                     = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    traffic_type                  = optional(string)
    transit_gateway_attachment_id = optional(string)
    transit_gateway_id            = optional(string)
    vpc_id                        = optional(string)
    destination_options           = optional(list(object({
            file_format                = optional(string)
            hive_compatible_partitions = optional(bool)
            per_hour_partition         = optional(bool)
        })))
  }))
}
