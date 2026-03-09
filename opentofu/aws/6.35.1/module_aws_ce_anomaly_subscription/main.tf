resource "aws_ce_anomaly_subscription" "ce_anomaly_subscriptions" {
  for_each = var.ce_anomaly_subscriptions

  frequency        = each.value.frequency
  monitor_arn_list = each.value.monitor_arn_list
  name             = each.value.name
  account_id       = each.value.account_id
  tags             = each.value.tags
  tags_all         = each.value.tags_all

  dynamic "subscriber" {
    for_each = each.value.subscriber != null ? each.value.subscriber : []
    content {
      address = subscriber.value.address
      type    = subscriber.value.type
    }
  }

  dynamic "threshold_expression" {
    for_each = each.value.threshold_expression != null ? each.value.threshold_expression : []
    content {

      dynamic "and" {
        for_each = threshold_expression.value.and != null ? threshold_expression.value.and : []
        content {

          dynamic "cost_category" {
            for_each = and.value.cost_category != null ? and.value.cost_category : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = and.value.dimension != null ? and.value.dimension : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

          dynamic "tags" {
            for_each = and.value.tags != null ? and.value.tags : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }

      dynamic "cost_category" {
        for_each = threshold_expression.value.cost_category != null ? threshold_expression.value.cost_category : []
        content {
          key           = cost_category.value.key
          match_options = cost_category.value.match_options
          values        = cost_category.value.values
        }
      }

      dynamic "dimension" {
        for_each = threshold_expression.value.dimension != null ? threshold_expression.value.dimension : []
        content {
          key           = dimension.value.key
          match_options = dimension.value.match_options
          values        = dimension.value.values
        }
      }

      dynamic "not" {
        for_each = threshold_expression.value.not != null ? threshold_expression.value.not : []
        content {

          dynamic "cost_category" {
            for_each = not.value.cost_category != null ? not.value.cost_category : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = not.value.dimension != null ? not.value.dimension : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

          dynamic "tags" {
            for_each = not.value.tags != null ? not.value.tags : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }

      dynamic "or" {
        for_each = threshold_expression.value.or != null ? threshold_expression.value.or : []
        content {

          dynamic "cost_category" {
            for_each = or.value.cost_category != null ? or.value.cost_category : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = or.value.dimension != null ? or.value.dimension : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

          dynamic "tags" {
            for_each = or.value.tags != null ? or.value.tags : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }

      dynamic "tags" {
        for_each = threshold_expression.value.tags != null ? threshold_expression.value.tags : []
        content {
          key           = tags.value.key
          match_options = tags.value.match_options
          values        = tags.value.values
        }
      }
    }
  }
}
