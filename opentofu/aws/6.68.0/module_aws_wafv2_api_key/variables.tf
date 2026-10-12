variable "wafv2_api_keys" {
  description = <<EOT
Map of wafv2_api_keys, attributes below
Required:
    - scope
    - token_domains
Optional:
    - region
EOT

  type = map(object({
    scope         = string
    token_domains = set(string)
    region        = optional(string)
  }))
}
