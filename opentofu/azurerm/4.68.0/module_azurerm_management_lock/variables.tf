variable "management_locks" {
  description = <<EOT
Map of management_locks, attributes below
Required:
    - lock_level
    - name
    - scope
Optional:
    - notes
EOT

  type = map(object({
    lock_level = string
    name       = string
    scope      = string
    notes      = optional(string)
  }))
}
