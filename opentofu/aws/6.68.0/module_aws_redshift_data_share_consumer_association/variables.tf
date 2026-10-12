variable "redshift_data_share_consumer_associations" {
  description = <<EOT
Map of redshift_data_share_consumer_associations, attributes below
Required:
    - data_share_arn
Optional:
    - allow_writes
    - associate_entire_account
    - consumer_arn
    - consumer_region
    - region
EOT

  type = map(object({
    data_share_arn           = string
    allow_writes             = optional(bool)
    associate_entire_account = optional(bool)
    consumer_arn             = optional(string)
    consumer_region          = optional(string)
    region                   = optional(string)
  }))
}
