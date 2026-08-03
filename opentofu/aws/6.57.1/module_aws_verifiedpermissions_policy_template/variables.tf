variable "verifiedpermissions_policy_templates" {
  description = <<EOT
Map of verifiedpermissions_policy_templates, attributes below
Required:
    - policy_store_id
    - statement
Optional:
    - description
    - region
EOT

  type = map(object({
    policy_store_id = string
    statement       = string
    description     = optional(string)
    region          = optional(string)
  }))
}
