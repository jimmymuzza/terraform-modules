variable "computeoptimizer_enrollment_status" {
  description = <<EOT
Map of computeoptimizer_enrollment_status, attributes below
Required:
    - status
Optional:
    - include_member_accounts
    - region
EOT

  type = map(object({
    status                  = string
    include_member_accounts = optional(bool)
    region                  = optional(string)
  }))
}
