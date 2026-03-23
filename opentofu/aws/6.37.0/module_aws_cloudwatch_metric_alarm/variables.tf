variable "cloudwatch_metric_alarms" {
  description = <<EOT
Map of cloudwatch_metric_alarms, attributes below
Required:
    - alarm_name
    - comparison_operator
    - evaluation_periods
Optional:
    - actions_enabled
    - alarm_actions
    - alarm_description
    - datapoints_to_alarm
    - dimensions
    - evaluate_low_sample_count_percentiles
    - extended_statistic
    - insufficient_data_actions
    - metric_name
    - namespace
    - ok_actions
    - period
    - region
    - statistic
    - tags
    - tags_all
    - threshold
    - threshold_metric_id
    - treat_missing_data
    - unit
    - metric_query
EOT

  type = map(object({
    alarm_name                            = string
    comparison_operator                   = string
    evaluation_periods                    = number
    actions_enabled                       = optional(bool)
    alarm_actions                         = optional(set(string))
    alarm_description                     = optional(string)
    datapoints_to_alarm                   = optional(number)
    dimensions                            = optional(map(string))
    evaluate_low_sample_count_percentiles = optional(string)
    extended_statistic                    = optional(string)
    insufficient_data_actions             = optional(set(string))
    metric_name                           = optional(string)
    namespace                             = optional(string)
    ok_actions                            = optional(set(string))
    period                                = optional(number)
    region                                = optional(string)
    statistic                             = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
    threshold                             = optional(number)
    threshold_metric_id                   = optional(string)
    treat_missing_data                    = optional(string)
    unit                                  = optional(string)
    metric_query                          = optional(set(object({
            account_id  = optional(string)
            expression  = optional(string)
            label       = optional(string)
            period      = optional(number)
            return_data = optional(bool)
            metric      = optional(list(object({
                metric_name = string
                period      = number
                stat        = string
                dimensions  = optional(map(string))
                namespace   = optional(string)
                unit        = optional(string)
            })))
        })))
  }))
}
