resource "aws_budgets_budget" "budgets_budgets" {
  for_each = var.budgets_budgets

  budget_type       = each.value.budget_type
  time_unit         = each.value.time_unit
  account_id        = each.value.account_id
  billing_view_arn  = each.value.billing_view_arn
  limit_amount      = each.value.limit_amount
  limit_unit        = each.value.limit_unit
  name              = each.value.name
  name_prefix       = each.value.name_prefix
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  time_period_end   = each.value.time_period_end
  time_period_start = each.value.time_period_start

  dynamic "auto_adjust_data" {
    for_each = each.value.auto_adjust_data != null ? each.value.auto_adjust_data : []
    content {
      auto_adjust_type = auto_adjust_data.value.auto_adjust_type

      dynamic "historical_options" {
        for_each = auto_adjust_data.value.historical_options != null ? auto_adjust_data.value.historical_options : []
        content {
          budget_adjustment_period = historical_options.value.budget_adjustment_period
        }
      }
    }
  }

  dynamic "cost_filter" {
    for_each = each.value.cost_filter != null ? each.value.cost_filter : []
    content {
      name   = cost_filter.value.name
      values = cost_filter.value.values
    }
  }

  dynamic "cost_types" {
    for_each = each.value.cost_types != null ? each.value.cost_types : []
    content {
      include_credit             = cost_types.value.include_credit
      include_discount           = cost_types.value.include_discount
      include_other_subscription = cost_types.value.include_other_subscription
      include_recurring          = cost_types.value.include_recurring
      include_refund             = cost_types.value.include_refund
      include_subscription       = cost_types.value.include_subscription
      include_support            = cost_types.value.include_support
      include_tax                = cost_types.value.include_tax
      include_upfront            = cost_types.value.include_upfront
      use_amortized              = cost_types.value.use_amortized
      use_blended                = cost_types.value.use_blended
    }
  }

  dynamic "filter_expression" {
    for_each = each.value.filter_expression != null ? each.value.filter_expression : []
    content {

      dynamic "and" {
        for_each = filter_expression.value.and != null ? filter_expression.value.and : []
        content {

          dynamic "and" {
            for_each = and.value.and != null ? and.value.and : []
            content {

              dynamic "cost_categories" {
                for_each = and.value.cost_categories != null ? and.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = and.value.dimensions != null ? and.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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

          dynamic "cost_categories" {
            for_each = and.value.cost_categories != null ? and.value.cost_categories : []
            content {
              key           = cost_categories.value.key
              match_options = cost_categories.value.match_options
              values        = cost_categories.value.values
            }
          }

          dynamic "dimensions" {
            for_each = and.value.dimensions != null ? and.value.dimensions : []
            content {
              key           = dimensions.value.key
              values        = dimensions.value.values
              match_options = dimensions.value.match_options
            }
          }

          dynamic "not" {
            for_each = and.value.not != null ? and.value.not : []
            content {

              dynamic "cost_categories" {
                for_each = not.value.cost_categories != null ? not.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = not.value.dimensions != null ? not.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
            for_each = and.value.or != null ? and.value.or : []
            content {

              dynamic "cost_categories" {
                for_each = or.value.cost_categories != null ? or.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = or.value.dimensions != null ? or.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
            for_each = and.value.tags != null ? and.value.tags : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }

      dynamic "cost_categories" {
        for_each = filter_expression.value.cost_categories != null ? filter_expression.value.cost_categories : []
        content {
          key           = cost_categories.value.key
          match_options = cost_categories.value.match_options
          values        = cost_categories.value.values
        }
      }

      dynamic "dimensions" {
        for_each = filter_expression.value.dimensions != null ? filter_expression.value.dimensions : []
        content {
          key           = dimensions.value.key
          values        = dimensions.value.values
          match_options = dimensions.value.match_options
        }
      }

      dynamic "not" {
        for_each = filter_expression.value.not != null ? filter_expression.value.not : []
        content {

          dynamic "and" {
            for_each = not.value.and != null ? not.value.and : []
            content {

              dynamic "cost_categories" {
                for_each = and.value.cost_categories != null ? and.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = and.value.dimensions != null ? and.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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

          dynamic "cost_categories" {
            for_each = not.value.cost_categories != null ? not.value.cost_categories : []
            content {
              key           = cost_categories.value.key
              match_options = cost_categories.value.match_options
              values        = cost_categories.value.values
            }
          }

          dynamic "dimensions" {
            for_each = not.value.dimensions != null ? not.value.dimensions : []
            content {
              key           = dimensions.value.key
              values        = dimensions.value.values
              match_options = dimensions.value.match_options
            }
          }

          dynamic "not" {
            for_each = not.value.not != null ? not.value.not : []
            content {

              dynamic "cost_categories" {
                for_each = not.value.cost_categories != null ? not.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = not.value.dimensions != null ? not.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
            for_each = not.value.or != null ? not.value.or : []
            content {

              dynamic "cost_categories" {
                for_each = or.value.cost_categories != null ? or.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = or.value.dimensions != null ? or.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
        for_each = filter_expression.value.or != null ? filter_expression.value.or : []
        content {

          dynamic "and" {
            for_each = or.value.and != null ? or.value.and : []
            content {

              dynamic "cost_categories" {
                for_each = and.value.cost_categories != null ? and.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = and.value.dimensions != null ? and.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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

          dynamic "cost_categories" {
            for_each = or.value.cost_categories != null ? or.value.cost_categories : []
            content {
              key           = cost_categories.value.key
              match_options = cost_categories.value.match_options
              values        = cost_categories.value.values
            }
          }

          dynamic "dimensions" {
            for_each = or.value.dimensions != null ? or.value.dimensions : []
            content {
              key           = dimensions.value.key
              values        = dimensions.value.values
              match_options = dimensions.value.match_options
            }
          }

          dynamic "not" {
            for_each = or.value.not != null ? or.value.not : []
            content {

              dynamic "cost_categories" {
                for_each = not.value.cost_categories != null ? not.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = not.value.dimensions != null ? not.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
            for_each = or.value.or != null ? or.value.or : []
            content {

              dynamic "cost_categories" {
                for_each = or.value.cost_categories != null ? or.value.cost_categories : []
                content {
                  key           = cost_categories.value.key
                  match_options = cost_categories.value.match_options
                  values        = cost_categories.value.values
                }
              }

              dynamic "dimensions" {
                for_each = or.value.dimensions != null ? or.value.dimensions : []
                content {
                  key           = dimensions.value.key
                  values        = dimensions.value.values
                  match_options = dimensions.value.match_options
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
        for_each = filter_expression.value.tags != null ? filter_expression.value.tags : []
        content {
          key           = tags.value.key
          match_options = tags.value.match_options
          values        = tags.value.values
        }
      }
    }
  }

  dynamic "notification" {
    for_each = each.value.notification != null ? each.value.notification : []
    content {
      comparison_operator        = notification.value.comparison_operator
      notification_type          = notification.value.notification_type
      threshold                  = notification.value.threshold
      threshold_type             = notification.value.threshold_type
      subscriber_email_addresses = notification.value.subscriber_email_addresses
      subscriber_sns_topic_arns  = notification.value.subscriber_sns_topic_arns
    }
  }

  dynamic "planned_limit" {
    for_each = each.value.planned_limit != null ? each.value.planned_limit : []
    content {
      amount     = planned_limit.value.amount
      start_time = planned_limit.value.start_time
      unit       = planned_limit.value.unit
    }
  }
}
