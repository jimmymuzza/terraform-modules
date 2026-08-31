variable "automation_source_controls" {
  description = <<EOT
Map of automation_source_controls, attributes below
Required:
    - automation_account_id
    - folder_path
    - name
    - repository_url
    - source_control_type
    - security
Optional:
    - automatic_sync
    - branch
    - description
    - publish_runbook_enabled
EOT

  type = map(object({
    automation_account_id   = string
    folder_path             = string
    name                    = string
    repository_url          = string
    source_control_type     = string
    automatic_sync          = optional(bool)
    branch                  = optional(string)
    description             = optional(string)
    publish_runbook_enabled = optional(bool)
    security                = list(object({
            token         = string
            token_type    = string
            refresh_token = optional(string)
        }))
  }))
}
