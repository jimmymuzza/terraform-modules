variable "bedrockagentcore_online_evaluation_configs" {
  description = <<EOT
Map of bedrockagentcore_online_evaluation_configs, attributes below
Required:
    - enable_on_create
    - evaluation_execution_role_arn
    - online_evaluation_config_name
Optional:
    - description
    - execution_status
    - region
    - tags
    - data_source_config
    - evaluator
    - rule
EOT

  type = map(object({
    enable_on_create              = bool
    evaluation_execution_role_arn = string
    online_evaluation_config_name = string
    description                   = optional(string)
    execution_status              = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    data_source_config            = optional(list(object({
            cloudwatch_logs = optional(list(object({
                log_group_names = list(string)
                service_names   = list(string)
            })))
        })))
    evaluator                     = optional(set(object({
            evaluator_id = string
        })))
    rule                          = optional(list(object({
            filter          = optional(list(object({
                key      = string
                operator = string
                value    = optional(list(object({
                    boolean_value = optional(bool)
                    double_value  = optional(number)
                    string_value  = optional(string)
                })))
            })))
            sampling_config = optional(list(object({
                sampling_percentage = number
            })))
            session_config  = optional(list(object({
                session_timeout_minutes = number
            })))
        })))
  }))
}
