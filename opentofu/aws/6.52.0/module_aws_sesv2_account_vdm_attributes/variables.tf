variable "sesv2_account_vdm_attributes" {
  description = <<EOT
Map of sesv2_account_vdm_attributes, attributes below
Required:
    - vdm_enabled
Optional:
    - region
    - dashboard_attributes
    - guardian_attributes
EOT

  type = map(object({
    vdm_enabled          = string
    region               = optional(string)
    dashboard_attributes = optional(list(object({
            engagement_metrics = optional(string)
        })))
    guardian_attributes  = optional(list(object({
            optimized_shared_delivery = optional(string)
        })))
  }))
}
