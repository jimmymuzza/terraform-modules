variable "ecs_account_setting_defaults" {
  description = <<EOT
Map of ecs_account_setting_defaults, attributes below
Required:
    - name
    - value
Optional:
    - region
EOT

  type = map(object({
    name   = string
    value  = string
    region = optional(string)
  }))
}
