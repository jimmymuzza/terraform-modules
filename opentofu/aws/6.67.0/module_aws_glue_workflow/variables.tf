variable "glue_workflows" {
  description = <<EOT
Map of glue_workflows, attributes below
Optional:
    - default_run_properties
    - description
    - max_concurrent_runs
    - name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    default_run_properties = optional(map(string))
    description            = optional(string)
    max_concurrent_runs    = optional(number)
    name                   = optional(string)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
