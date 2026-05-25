variable "scheduler_schedule_groups" {
  description = <<EOT
Map of scheduler_schedule_groups, attributes below
Optional:
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = optional(string)
    name_prefix = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
