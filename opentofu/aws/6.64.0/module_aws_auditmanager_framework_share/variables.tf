variable "auditmanager_framework_shares" {
  description = <<EOT
Map of auditmanager_framework_shares, attributes below
Required:
    - destination_account
    - destination_region
    - framework_id
Optional:
    - comment
    - region
EOT

  type = map(object({
    destination_account = string
    destination_region  = string
    framework_id        = string
    comment             = optional(string)
    region              = optional(string)
  }))
}
