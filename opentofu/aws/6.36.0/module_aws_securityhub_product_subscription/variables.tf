variable "securityhub_product_subscriptions" {
  description = <<EOT
Map of securityhub_product_subscriptions, attributes below
Required:
    - product_arn
Optional:
    - region
EOT

  type = map(object({
    product_arn = string
    region      = optional(string)
  }))
}
