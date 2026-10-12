variable "redshift_data_share_authorizations" {
  description = <<EOT
Map of redshift_data_share_authorizations, attributes below
Required:
    - consumer_identifier
    - data_share_arn
Optional:
    - allow_writes
    - region
EOT

  type = map(object({
    consumer_identifier = string
    data_share_arn      = string
    allow_writes        = optional(bool)
    region              = optional(string)
  }))
}
