variable "api_gateway_accounts" {
  description = <<EOT
Map of api_gateway_accounts, attributes below
Optional:
    - cloudwatch_role_arn
    - region
EOT

  type = map(object({
    cloudwatch_role_arn = optional(string)
    region              = optional(string)
  }))
}
