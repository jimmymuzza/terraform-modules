variable "subscription_cost_management_views" {
  description = <<EOT
Map of subscription_cost_management_views, attributes below
Required:
    - accumulated
    - chart_type
    - display_name
    - name
    - report_type
    - subscription_id
    - timeframe
    - dataset
Optional:
    - kpi
    - pivot
EOT

  type = map(object({
    accumulated     = bool
    chart_type      = string
    display_name    = string
    name            = string
    report_type     = string
    subscription_id = string
    timeframe       = string
    dataset         = list(object({
            granularity = string
            aggregation = set(object({
                column_name = string
                name        = string
            }))
            grouping    = optional(list(object({
                name = string
                type = string
            })))
            sorting     = optional(list(object({
                direction = string
                name      = string
            })))
        }))
    kpi             = optional(list(object({
            type = string
        })))
    pivot           = optional(list(object({
            name = string
            type = string
        })))
  }))
}
