variable "redshift_loggings" {
  description = <<EOT
Map of redshift_loggings, attributes below
Required:
    - cluster_identifier
Optional:
    - bucket_name
    - log_destination_type
    - log_exports
    - region
    - s3_key_prefix
EOT

  type = map(object({
    cluster_identifier   = string
    bucket_name          = optional(string)
    log_destination_type = optional(string)
    log_exports          = optional(set(string))
    region               = optional(string)
    s3_key_prefix        = optional(string)
  }))
}
