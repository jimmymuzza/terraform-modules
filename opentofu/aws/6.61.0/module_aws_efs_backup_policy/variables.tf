variable "efs_backup_policies" {
  description = <<EOT
Map of efs_backup_policies, attributes below
Required:
    - file_system_id
    - backup_policy
Optional:
    - region
EOT

  type = map(object({
    file_system_id = string
    region         = optional(string)
    backup_policy  = list(object({
            status = string
        }))
  }))
}
