variable "cloudwatch_metric_streams" {
  description = <<EOT
Map of cloudwatch_metric_streams, attributes below
Required:
    - firehose_arn
    - output_format
    - role_arn
Optional:
    - include_linked_accounts_metrics
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - exclude_filter
    - include_filter
    - statistics_configuration
EOT

  type = map(object({
    firehose_arn                    = string
    output_format                   = string
    role_arn                        = string
    include_linked_accounts_metrics = optional(bool)
    name                            = optional(string)
    name_prefix                     = optional(string)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    exclude_filter                  = optional(set(object({
            namespace    = string
            metric_names = optional(set(string))
        })))
    include_filter                  = optional(set(object({
            namespace    = string
            metric_names = optional(set(string))
        })))
    statistics_configuration        = optional(set(object({
            additional_statistics = set(string)
            include_metric        = set(object({
                metric_name = string
                namespace   = string
            }))
        })))
  }))
}
