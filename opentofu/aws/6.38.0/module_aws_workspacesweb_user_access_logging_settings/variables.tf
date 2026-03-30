variable "workspacesweb_user_access_logging_settings" {
  description = <<EOT
Map of workspacesweb_user_access_logging_settings, attributes below
Required:
    - kinesis_stream_arn
Optional:
    - region
    - tags
EOT

  type = map(object({
    kinesis_stream_arn = string
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
