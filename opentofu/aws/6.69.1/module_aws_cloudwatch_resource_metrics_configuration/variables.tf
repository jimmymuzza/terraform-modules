variable "cloudwatch_resource_metrics_configurations" {
  description = <<EOT
Map of cloudwatch_resource_metrics_configurations, attributes below
Required:
    - resource_arn
Optional:
    - region
    - metric_selection
EOT

  type = map(object({
    resource_arn     = string
    region           = optional(string)
    metric_selection = optional(list(object({
            include_metrics = set(string)
        })))
  }))
}
