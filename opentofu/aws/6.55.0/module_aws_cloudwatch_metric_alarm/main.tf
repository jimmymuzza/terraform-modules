resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarms" {
  for_each = var.cloudwatch_metric_alarms

  alarm_name                            = each.value.alarm_name
  actions_enabled                       = each.value.actions_enabled
  alarm_actions                         = each.value.alarm_actions
  alarm_description                     = each.value.alarm_description
  comparison_operator                   = each.value.comparison_operator
  datapoints_to_alarm                   = each.value.datapoints_to_alarm
  dimensions                            = each.value.dimensions
  evaluate_low_sample_count_percentiles = each.value.evaluate_low_sample_count_percentiles
  evaluation_interval                   = each.value.evaluation_interval
  evaluation_periods                    = each.value.evaluation_periods
  extended_statistic                    = each.value.extended_statistic
  insufficient_data_actions             = each.value.insufficient_data_actions
  metric_name                           = each.value.metric_name
  namespace                             = each.value.namespace
  ok_actions                            = each.value.ok_actions
  period                                = each.value.period
  region                                = each.value.region
  statistic                             = each.value.statistic
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
  threshold                             = each.value.threshold
  threshold_metric_id                   = each.value.threshold_metric_id
  treat_missing_data                    = each.value.treat_missing_data
  unit                                  = each.value.unit

  dynamic "evaluation_criteria" {
    for_each = each.value.evaluation_criteria != null ? each.value.evaluation_criteria : []
    content {

      dynamic "promql_criteria" {
        for_each = evaluation_criteria.value.promql_criteria != null ? evaluation_criteria.value.promql_criteria : []
        content {
          query           = promql_criteria.value.query
          pending_period  = promql_criteria.value.pending_period
          recovery_period = promql_criteria.value.recovery_period
        }
      }
    }
  }

  dynamic "metric_query" {
    for_each = each.value.metric_query != null ? each.value.metric_query : []
    content {
      account_id  = metric_query.value.account_id
      expression  = metric_query.value.expression
      label       = metric_query.value.label
      period      = metric_query.value.period
      return_data = metric_query.value.return_data

      dynamic "metric" {
        for_each = metric_query.value.metric != null ? metric_query.value.metric : []
        content {
          metric_name = metric.value.metric_name
          period      = metric.value.period
          stat        = metric.value.stat
          dimensions  = metric.value.dimensions
          namespace   = metric.value.namespace
          unit        = metric.value.unit
        }
      }
    }
  }
}
