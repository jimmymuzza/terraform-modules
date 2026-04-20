variable "redshift_snapshot_schedules" {
  description = <<EOT
Map of redshift_snapshot_schedules, attributes below
Required:
    - definitions
Optional:
    - description
    - force_destroy
    - identifier
    - identifier_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    definitions       = set(string)
    description       = optional(string)
    force_destroy     = optional(bool)
    identifier        = optional(string)
    identifier_prefix = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
