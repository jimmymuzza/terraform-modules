variable "spot_datafeed_subscriptions" {
  description = <<EOT
Map of spot_datafeed_subscriptions, attributes below
Required:
    - bucket
Optional:
    - prefix
    - region
EOT

  type = map(object({
    bucket = string
    prefix = optional(string)
    region = optional(string)
  }))
}
