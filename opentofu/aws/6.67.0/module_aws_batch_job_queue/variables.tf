variable "batch_job_queues" {
  description = <<EOT
Map of batch_job_queues, attributes below
Required:
    - name
    - priority
    - state
Optional:
    - region
    - scheduling_policy_arn
    - tags
    - compute_environment_order
    - job_state_time_limit_action
EOT

  type = map(object({
    name                        = string
    priority                    = number
    state                       = string
    region                      = optional(string)
    scheduling_policy_arn       = optional(string)
    tags                        = optional(map(string))
    compute_environment_order   = optional(list(object({
            compute_environment = string
            order               = number
        })))
    job_state_time_limit_action = optional(list(object({
            action           = string
            max_time_seconds = number
            reason           = string
            state            = string
        })))
  }))
}
