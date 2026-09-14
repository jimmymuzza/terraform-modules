variable "ssmincidents_response_plans" {
  description = <<EOT
Map of ssmincidents_response_plans, attributes below
Required:
    - name
    - incident_template
Optional:
    - chat_channel
    - display_name
    - engagements
    - region
    - tags
    - tags_all
    - action
    - integration
EOT

  type = map(object({
    name              = string
    chat_channel      = optional(set(string))
    display_name      = optional(string)
    engagements       = optional(set(string))
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    action            = optional(list(object({
            ssm_automation = optional(list(object({
                document_name      = string
                role_arn           = string
                document_version   = optional(string)
                dynamic_parameters = optional(map(string))
                target_account     = optional(string)
                parameter          = optional(set(object({
                    name   = string
                    values = set(string)
                })))
            })))
        })))
    incident_template = list(object({
            impact              = number
            title               = string
            dedupe_string       = optional(string)
            incident_tags       = optional(map(string))
            summary             = optional(string)
            notification_target = optional(set(object({
                sns_topic_arn = string
            })))
        }))
    integration       = optional(list(object({
            pagerduty = optional(list(object({
                name       = string
                secret_id  = string
                service_id = string
            })))
        })))
  }))
}
