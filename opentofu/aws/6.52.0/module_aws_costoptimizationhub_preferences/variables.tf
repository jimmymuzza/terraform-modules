variable "costoptimizationhub_preferences" {
  description = <<EOT
Map of costoptimizationhub_preferences, attributes below
Optional:
    - member_account_discount_visibility
    - savings_estimation_mode
EOT

  type = map(object({
    member_account_discount_visibility = optional(string)
    savings_estimation_mode            = optional(string)
  }))
}
