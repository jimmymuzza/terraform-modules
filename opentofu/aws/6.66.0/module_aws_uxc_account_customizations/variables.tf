variable "uxc_account_customizations" {
  description = <<EOT
Map of uxc_account_customizations, attributes below
Optional:
    - account_color
    - visible_regions
    - visible_services
EOT

  type = map(object({
    account_color    = optional(string)
    visible_regions  = optional(set(string))
    visible_services = optional(set(string))
  }))
}
