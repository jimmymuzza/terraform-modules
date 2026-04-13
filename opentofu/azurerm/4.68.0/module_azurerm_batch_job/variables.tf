variable "batch_jobs" {
  description = <<EOT
Map of batch_jobs, attributes below
Required:
    - batch_pool_id
    - name
Optional:
    - common_environment_properties
    - display_name
    - priority
    - task_retry_maximum
EOT

  type = map(object({
    batch_pool_id                 = string
    name                          = string
    common_environment_properties = optional(map(string))
    display_name                  = optional(string)
    priority                      = optional(number)
    task_retry_maximum            = optional(number)
  }))
}
