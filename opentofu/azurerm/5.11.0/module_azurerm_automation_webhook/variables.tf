variable "automation_webhooks" {
  description = <<EOT
Map of automation_webhooks, attributes below
Required:
    - automation_account_name
    - expiry_time
    - name
    - resource_group_name
    - runbook_name
Optional:
    - enabled
    - parameters
    - run_on_worker_group
    - uri
EOT

  type = map(object({
    automation_account_name = string
    expiry_time             = string
    name                    = string
    resource_group_name     = string
    runbook_name            = string
    enabled                 = optional(bool)
    parameters              = optional(map(string))
    run_on_worker_group     = optional(string)
    uri                     = optional(string)
  }))
}
