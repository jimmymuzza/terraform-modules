variable "workspacesweb_session_logger_associations" {
  description = <<EOT
Map of workspacesweb_session_logger_associations, attributes below
Required:
    - portal_arn
    - session_logger_arn
Optional:
    - region
EOT

  type = map(object({
    portal_arn         = string
    session_logger_arn = string
    region             = optional(string)
  }))
}
