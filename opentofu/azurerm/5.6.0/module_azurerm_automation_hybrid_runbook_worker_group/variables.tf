variable "automation_hybrid_runbook_worker_groups" {
  description = <<EOT
Map of automation_hybrid_runbook_worker_groups, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
Optional:
    - credential_name
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    credential_name         = optional(string)
  }))
}
