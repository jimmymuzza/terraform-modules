variable "rum_metrics_destinations" {
  description = <<EOT
Map of rum_metrics_destinations, attributes below
Required:
    - app_monitor_name
    - destination
Optional:
    - destination_arn
    - iam_role_arn
    - region
EOT

  type = map(object({
    app_monitor_name = string
    destination      = string
    destination_arn  = optional(string)
    iam_role_arn     = optional(string)
    region           = optional(string)
  }))
}
