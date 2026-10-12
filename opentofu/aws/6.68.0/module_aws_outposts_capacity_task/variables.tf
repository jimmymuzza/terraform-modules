variable "outposts_capacity_tasks" {
  description = <<EOT
Map of outposts_capacity_tasks, attributes below
Required:
    - outpost_identifier
Optional:
    - asset_id
    - order_id
    - region
    - task_action_on_blocking_instances
    - instance_pool
    - instances_to_exclude
EOT

  type = map(object({
    outpost_identifier                = string
    asset_id                          = optional(string)
    order_id                          = optional(string)
    region                            = optional(string)
    task_action_on_blocking_instances = optional(string)
    instance_pool                     = optional(list(object({
            count         = number
            instance_type = string
        })))
    instances_to_exclude              = optional(list(object({
            instances = set(string)
        })))
  }))
}
