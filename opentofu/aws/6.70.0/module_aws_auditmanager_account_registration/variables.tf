variable "auditmanager_account_registrations" {
  description = <<EOT
Map of auditmanager_account_registrations, attributes below
Optional:
    - delegated_admin_account
    - deregister_on_destroy
    - kms_key
    - region
EOT

  type = map(object({
    delegated_admin_account = optional(string)
    deregister_on_destroy   = optional(bool)
    kms_key                 = optional(string)
    region                  = optional(string)
  }))
}
