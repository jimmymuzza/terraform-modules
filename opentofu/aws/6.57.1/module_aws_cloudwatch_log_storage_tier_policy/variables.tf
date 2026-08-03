variable "cloudwatch_log_storage_tier_policies" {
  description = <<EOT
Map of cloudwatch_log_storage_tier_policies, attributes below
Required:
    - storage_tier
Optional:
    - region
EOT

  type = map(object({
    storage_tier = string
    region       = optional(string)
  }))
}
