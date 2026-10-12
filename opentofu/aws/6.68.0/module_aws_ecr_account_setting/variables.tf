variable "ecr_account_settings" {
  description = <<EOT
Map of ecr_account_settings, attributes below
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
