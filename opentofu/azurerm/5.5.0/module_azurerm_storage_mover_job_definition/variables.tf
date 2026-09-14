variable "storage_mover_job_definitions" {
  description = <<EOT
Map of storage_mover_job_definitions, attributes below
Required:
    - copy_mode
    - name
    - source_name
    - storage_mover_project_id
    - target_name
Optional:
    - agent_name
    - description
    - source_sub_path
    - target_sub_path
EOT

  type = map(object({
    copy_mode                = string
    name                     = string
    source_name              = string
    storage_mover_project_id = string
    target_name              = string
    agent_name               = optional(string)
    description              = optional(string)
    source_sub_path          = optional(string)
    target_sub_path          = optional(string)
  }))
}
