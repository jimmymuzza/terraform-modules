variable "ses_receipt_rules" {
  description = <<EOT
Map of ses_receipt_rules, attributes below
Required:
    - name
    - rule_set_name
Optional:
    - after
    - enabled
    - recipients
    - region
    - scan_enabled
    - tls_policy
    - add_header_action
    - bounce_action
    - lambda_action
    - s3_action
    - sns_action
    - stop_action
    - workmail_action
EOT

  type = map(object({
    name              = string
    rule_set_name     = string
    after             = optional(string)
    enabled           = optional(bool)
    recipients        = optional(set(string))
    region            = optional(string)
    scan_enabled      = optional(bool)
    tls_policy        = optional(string)
    add_header_action = optional(set(object({
            header_name  = string
            header_value = string
            position     = number
        })))
    bounce_action     = optional(set(object({
            message         = string
            position        = number
            sender          = string
            smtp_reply_code = string
            status_code     = optional(string)
            topic_arn       = optional(string)
        })))
    lambda_action     = optional(set(object({
            function_arn    = string
            position        = number
            invocation_type = optional(string)
            topic_arn       = optional(string)
        })))
    s3_action         = optional(set(object({
            bucket_name       = string
            position          = number
            iam_role_arn      = optional(string)
            kms_key_arn       = optional(string)
            object_key_prefix = optional(string)
            topic_arn         = optional(string)
        })))
    sns_action        = optional(set(object({
            position  = number
            topic_arn = string
            encoding  = optional(string)
        })))
    stop_action       = optional(set(object({
            position  = number
            scope     = string
            topic_arn = optional(string)
        })))
    workmail_action   = optional(set(object({
            organization_arn = string
            position         = number
            topic_arn        = optional(string)
        })))
  }))
}
