variable "fms_admin_accounts" {
  description = <<EOT
Map of fms_admin_accounts, attributes below
Optional:
    - account_id
EOT

  type = map(object({
    account_id = optional(string)
  }))
}
