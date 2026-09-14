variable "savingsplans_savings_plans" {
  description = <<EOT
Map of savingsplans_savings_plans, attributes below
Required:
    - commitment
    - savings_plan_offering_id
Optional:
    - purchase_time
    - tags
    - upfront_payment_amount
EOT

  type = map(object({
    commitment               = string
    savings_plan_offering_id = string
    purchase_time            = optional(string)
    tags                     = optional(map(string))
    upfront_payment_amount   = optional(string)
  }))
}
