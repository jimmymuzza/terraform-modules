variable "verifiedpermissions_schemas" {
  description = <<EOT
Map of verifiedpermissions_schemas, attributes below
Required:
    - policy_store_id
Optional:
    - region
    - definition
EOT

  type = map(object({
    policy_store_id = string
    region          = optional(string)
    definition      = optional(list(object({
            value = string
        })))
  }))
}
