variable "codeguruprofiler_profiling_groups" {
  description = <<EOT
Map of codeguruprofiler_profiling_groups, attributes below
Required:
    - name
Optional:
    - compute_platform
    - region
    - tags
    - agent_orchestration_config
EOT

  type = map(object({
    name                       = string
    compute_platform           = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    agent_orchestration_config = optional(list(object({
            profiling_enabled = bool
        })))
  }))
}
