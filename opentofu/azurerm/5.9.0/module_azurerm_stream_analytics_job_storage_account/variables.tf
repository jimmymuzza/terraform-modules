variable "stream_analytics_job_storage_accounts" {
  description = <<EOT
Map of stream_analytics_job_storage_accounts, attributes below
Required:
    - authentication_mode
    - storage_account_name
    - stream_analytics_job_id
Optional:
    - storage_account_key
EOT

  type = map(object({
    authentication_mode     = string
    storage_account_name    = string
    stream_analytics_job_id = string
    storage_account_key     = optional(string)
  }))
}
