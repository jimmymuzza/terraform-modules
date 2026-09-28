variable "securitylake_aws_log_sources" {
  description = <<EOT
Map of securitylake_aws_log_sources, attributes below
Optional:
    - region
    - source
EOT

  type = map(object({
    region = optional(string)
    source = optional(list(object({
            regions        = set(string)
            source_name    = string
            accounts       = optional(set(string))
            source_version = optional(string)
        })))
  }))
}
