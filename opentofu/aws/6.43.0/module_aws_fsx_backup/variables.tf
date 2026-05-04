variable "fsx_backups" {
  description = <<EOT
Map of fsx_backups, attributes below
Optional:
    - file_system_id
    - region
    - tags
    - tags_all
    - volume_id
EOT

  type = map(object({
    file_system_id = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    volume_id      = optional(string)
  }))
}
