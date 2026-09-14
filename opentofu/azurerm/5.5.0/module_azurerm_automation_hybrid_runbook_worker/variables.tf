variable "automation_hybrid_runbook_workers" {
  description = <<EOT
Map of automation_hybrid_runbook_workers, attributes below
Required:
    - automation_account_name
    - resource_group_name
    - vm_resource_id
    - worker_group_name
    - worker_id
EOT

  type = map(object({
    automation_account_name = string
    resource_group_name     = string
    vm_resource_id          = string
    worker_group_name       = string
    worker_id               = string
  }))
}
