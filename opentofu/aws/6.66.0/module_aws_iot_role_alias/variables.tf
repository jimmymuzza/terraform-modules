variable "iot_role_alias" {
  description = <<EOT
Map of iot_role_alias, attributes below
Required:
    - alias
    - role_arn
Optional:
    - credential_duration
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    alias               = string
    role_arn            = string
    credential_duration = optional(number)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
