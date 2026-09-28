variable "securityhub_feature_v2s" {
  description = <<EOT
Map of securityhub_feature_v2s, attributes below
Required:
    - feature_name
    - feature_status
Optional:
    - region
EOT

  type = map(object({
    feature_name   = string
    feature_status = string
    region         = optional(string)
  }))
}
