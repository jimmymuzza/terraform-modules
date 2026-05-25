variable "prometheus_query_logging_configurations" {
  description = <<EOT
Map of prometheus_query_logging_configurations, attributes below
Required:
    - workspace_id
Optional:
    - region
    - destination
EOT

  type = map(object({
    workspace_id = string
    region       = optional(string)
    destination  = optional(list(object({
            cloudwatch_logs = optional(list(object({
                log_group_arn = string
            })))
            filters         = optional(list(object({
                qsp_threshold = number
            })))
        })))
  }))
}
