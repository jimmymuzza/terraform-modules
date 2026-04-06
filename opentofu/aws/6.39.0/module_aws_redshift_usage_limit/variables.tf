variable "redshift_usage_limits" {
  description = <<EOT
Map of redshift_usage_limits, attributes below
Required:
    - amount
    - cluster_identifier
    - feature_type
    - limit_type
Optional:
    - breach_action
    - period
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    amount             = number
    cluster_identifier = string
    feature_type       = string
    limit_type         = string
    breach_action      = optional(string)
    period             = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
