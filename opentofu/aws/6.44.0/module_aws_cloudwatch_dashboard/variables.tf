variable "cloudwatch_dashboards" {
  description = <<EOT
Map of cloudwatch_dashboards, attributes below
Required:
    - dashboard_body
    - dashboard_name
Optional:
    - region
EOT

  type = map(object({
    dashboard_body = string
    dashboard_name = string
    region         = optional(string)
  }))
}
