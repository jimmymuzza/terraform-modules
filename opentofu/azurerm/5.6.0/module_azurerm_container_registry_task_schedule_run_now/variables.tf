variable "container_registry_task_schedule_run_nows" {
  description = <<EOT
Map of container_registry_task_schedule_run_nows, attributes below
Required:
    - container_registry_task_id
EOT

  type = map(object({
    container_registry_task_id = string
  }))
}
