variable "costoptimizationhub_enrollment_status" {
  description = <<EOT
Map of costoptimizationhub_enrollment_status, attributes below
Optional:
    - include_member_accounts
EOT

  type = map(object({
    include_member_accounts = optional(bool)
  }))
}
