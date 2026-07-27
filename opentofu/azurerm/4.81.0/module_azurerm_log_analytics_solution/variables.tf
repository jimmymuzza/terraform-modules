variable "log_analytics_solutions" {
  description = <<EOT
Map of log_analytics_solutions, attributes below
Required:
    - location
    - resource_group_name
    - solution_name
    - workspace_name
    - workspace_resource_id
    - plan
Optional:
    - tags
EOT

  type = map(object({
    location              = string
    resource_group_name   = string
    solution_name         = string
    workspace_name        = string
    workspace_resource_id = string
    tags                  = optional(map(string))
    plan                  = list(object({
            product        = string
            publisher      = string
            promotion_code = optional(string)
        }))
  }))
}
