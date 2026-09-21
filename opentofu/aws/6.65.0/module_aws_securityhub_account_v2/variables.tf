variable "securityhub_account_v2s" {
  description = <<EOT
Map of securityhub_account_v2s, attributes below
Optional:
    - region
    - tags
EOT

  type = map(object({
    region = optional(string)
    tags   = optional(map(string))
  }))
}
