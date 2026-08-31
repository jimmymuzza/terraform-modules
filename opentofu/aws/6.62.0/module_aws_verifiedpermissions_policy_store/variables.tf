variable "verifiedpermissions_policy_stores" {
  description = <<EOT
Map of verifiedpermissions_policy_stores, attributes below
Optional:
    - deletion_protection
    - description
    - region
    - tags
    - validation_settings
EOT

  type = map(object({
    deletion_protection = optional(string)
    description         = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    validation_settings = optional(list(object({
            mode = string
        })))
  }))
}
