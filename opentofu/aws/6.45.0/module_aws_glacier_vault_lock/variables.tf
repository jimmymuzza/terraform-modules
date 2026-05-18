variable "glacier_vault_locks" {
  description = <<EOT
Map of glacier_vault_locks, attributes below
Required:
    - complete_lock
    - policy
    - vault_name
Optional:
    - ignore_deletion_error
    - region
EOT

  type = map(object({
    complete_lock         = bool
    policy                = string
    vault_name            = string
    ignore_deletion_error = optional(bool)
    region                = optional(string)
  }))
}
