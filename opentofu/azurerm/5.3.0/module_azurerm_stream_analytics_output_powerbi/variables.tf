variable "stream_analytics_output_powerbis" {
  description = <<EOT
Map of stream_analytics_output_powerbis, attributes below
Required:
    - dataset
    - group_id
    - group_name
    - name
    - stream_analytics_job_id
    - table
Optional:
    - token_user_display_name
    - token_user_principal_name
EOT

  type = map(object({
    dataset                   = string
    group_id                  = string
    group_name                = string
    name                      = string
    stream_analytics_job_id   = string
    table                     = string
    token_user_display_name   = optional(string)
    token_user_principal_name = optional(string)
  }))
}
