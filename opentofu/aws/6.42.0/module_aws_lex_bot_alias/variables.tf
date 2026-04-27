variable "lex_bot_alias" {
  description = <<EOT
Map of lex_bot_alias, attributes below
Required:
    - bot_name
    - bot_version
    - name
Optional:
    - description
    - region
    - conversation_logs
EOT

  type = map(object({
    bot_name          = string
    bot_version       = string
    name              = string
    description       = optional(string)
    region            = optional(string)
    conversation_logs = optional(list(object({
            iam_role_arn = string
            log_settings = optional(set(object({
                destination  = string
                log_type     = string
                resource_arn = string
                kms_key_arn  = optional(string)
            })))
        })))
  }))
}
