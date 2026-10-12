variable "lambda_resource_policies" {
  description = <<EOT
Map of lambda_resource_policies, attributes below
Required:
    - policy
    - resource_arn
Optional:
    - region
EOT

  type = map(object({
    policy       = string
    resource_arn = string
    region       = optional(string)
  }))
}
