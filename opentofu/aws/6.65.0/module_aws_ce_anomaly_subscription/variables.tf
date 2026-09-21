variable "ce_anomaly_subscriptions" {
  description = <<EOT
Map of ce_anomaly_subscriptions, attributes below
Required:
    - frequency
    - monitor_arn_list
    - name
    - subscriber
Optional:
    - account_id
    - tags
    - tags_all
    - threshold_expression
EOT

  type = map(object({
    frequency            = string
    monitor_arn_list     = list(string)
    name                 = string
    account_id           = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    subscriber           = set(object({
            address = string
            type    = string
        }))
    threshold_expression = optional(list(object({
            and           = optional(set(object({
                cost_category = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                dimension     = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                tags          = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
            })))
            cost_category = optional(list(object({
                key           = optional(string)
                match_options = optional(set(string))
                values        = optional(set(string))
            })))
            dimension     = optional(list(object({
                key           = optional(string)
                match_options = optional(set(string))
                values        = optional(set(string))
            })))
            not           = optional(list(object({
                cost_category = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                dimension     = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                tags          = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
            })))
            or            = optional(set(object({
                cost_category = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                dimension     = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                tags          = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
            })))
            tags          = optional(list(object({
                key           = optional(string)
                match_options = optional(set(string))
                values        = optional(set(string))
            })))
        })))
  }))
}
