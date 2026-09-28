variable "budgets_budgets" {
  description = <<EOT
Map of budgets_budgets, attributes below
Required:
    - budget_type
    - time_unit
Optional:
    - account_id
    - billing_view_arn
    - limit_amount
    - limit_unit
    - metrics
    - name
    - name_prefix
    - tags
    - tags_all
    - time_period_end
    - time_period_start
    - auto_adjust_data
    - cost_filter
    - cost_types
    - filter_expression
    - notification
    - planned_limit
EOT

  type = map(object({
    budget_type       = string
    time_unit         = string
    account_id        = optional(string)
    billing_view_arn  = optional(string)
    limit_amount      = optional(string)
    limit_unit        = optional(string)
    metrics           = optional(list(string))
    name              = optional(string)
    name_prefix       = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    time_period_end   = optional(string)
    time_period_start = optional(string)
    auto_adjust_data  = optional(list(object({
            auto_adjust_type   = string
            historical_options = optional(list(object({
                budget_adjustment_period = number
            })))
        })))
    cost_filter       = optional(set(object({
            name   = string
            values = list(string)
        })))
    cost_types        = optional(list(object({
            include_credit             = optional(bool)
            include_discount           = optional(bool)
            include_other_subscription = optional(bool)
            include_recurring          = optional(bool)
            include_refund             = optional(bool)
            include_subscription       = optional(bool)
            include_support            = optional(bool)
            include_tax                = optional(bool)
            include_upfront            = optional(bool)
            use_amortized              = optional(bool)
            use_blended                = optional(bool)
        })))
    filter_expression = optional(list(object({
            and             = optional(list(object({
                and             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                cost_categories = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
                dimensions      = optional(list(object({
                    key           = string
                    values        = list(string)
                    match_options = optional(list(string))
                })))
                not             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                or              = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                tags            = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
            })))
            cost_categories = optional(list(object({
                key           = optional(string)
                match_options = optional(list(string))
                values        = optional(list(string))
            })))
            dimensions      = optional(list(object({
                key           = string
                values        = list(string)
                match_options = optional(list(string))
            })))
            not             = optional(list(object({
                and             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                cost_categories = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
                dimensions      = optional(list(object({
                    key           = string
                    values        = list(string)
                    match_options = optional(list(string))
                })))
                not             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                or              = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                tags            = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
            })))
            or              = optional(list(object({
                and             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                cost_categories = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
                dimensions      = optional(list(object({
                    key           = string
                    values        = list(string)
                    match_options = optional(list(string))
                })))
                not             = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                or              = optional(list(object({
                    cost_categories = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                    dimensions      = optional(list(object({
                        key           = string
                        values        = list(string)
                        match_options = optional(list(string))
                    })))
                    tags            = optional(list(object({
                        key           = optional(string)
                        match_options = optional(list(string))
                        values        = optional(list(string))
                    })))
                })))
                tags            = optional(list(object({
                    key           = optional(string)
                    match_options = optional(list(string))
                    values        = optional(list(string))
                })))
            })))
            tags            = optional(list(object({
                key           = optional(string)
                match_options = optional(list(string))
                values        = optional(list(string))
            })))
        })))
    notification      = optional(set(object({
            comparison_operator        = string
            notification_type          = string
            threshold                  = number
            threshold_type             = string
            subscriber_email_addresses = optional(set(string))
            subscriber_sns_topic_arns  = optional(set(string))
        })))
    planned_limit     = optional(set(object({
            amount     = string
            start_time = string
            unit       = string
        })))
  }))
}
