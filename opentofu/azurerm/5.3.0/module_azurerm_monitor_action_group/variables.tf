variable "monitor_action_groups" {
  description = <<EOT
Map of monitor_action_groups, attributes below
Required:
    - name
    - resource_group_name
    - short_name
Optional:
    - enabled
    - location
    - tags
    - arm_role_receiver
    - automation_runbook_receiver
    - azure_app_push_receiver
    - azure_function_receiver
    - email_receiver
    - event_hub_receiver
    - itsm_receiver
    - logic_app_receiver
    - sms_receiver
    - voice_receiver
    - webhook_receiver
EOT

  type = map(object({
    name                        = string
    resource_group_name         = string
    short_name                  = string
    enabled                     = optional(bool)
    location                    = optional(string)
    tags                        = optional(map(string))
    arm_role_receiver           = optional(list(object({
            name                    = string
            role_id                 = string
            use_common_alert_schema = optional(bool)
        })))
    automation_runbook_receiver = optional(list(object({
            automation_account_id   = string
            is_global_runbook       = bool
            name                    = string
            runbook_name            = string
            service_uri             = string
            webhook_resource_id     = string
            use_common_alert_schema = optional(bool)
        })))
    azure_app_push_receiver     = optional(list(object({
            email_address = string
            name          = string
        })))
    azure_function_receiver     = optional(list(object({
            function_app_resource_id = string
            function_name            = string
            http_trigger_url         = string
            name                     = string
            use_common_alert_schema  = optional(bool)
        })))
    email_receiver              = optional(list(object({
            email_address           = string
            name                    = string
            use_common_alert_schema = optional(bool)
        })))
    event_hub_receiver          = optional(list(object({
            event_hub_name          = string
            event_hub_namespace     = string
            name                    = string
            subscription_id         = optional(string)
            tenant_id               = optional(string)
            use_common_alert_schema = optional(bool)
        })))
    itsm_receiver               = optional(list(object({
            connection_id        = string
            name                 = string
            region               = string
            ticket_configuration = string
            workspace_id         = string
        })))
    logic_app_receiver          = optional(list(object({
            callback_url            = string
            name                    = string
            resource_id             = string
            use_common_alert_schema = optional(bool)
        })))
    sms_receiver                = optional(list(object({
            country_code = string
            name         = string
            phone_number = string
        })))
    voice_receiver              = optional(list(object({
            country_code = string
            name         = string
            phone_number = string
        })))
    webhook_receiver            = optional(list(object({
            name                    = string
            service_uri             = string
            use_common_alert_schema = optional(bool)
            aad_auth                = optional(list(object({
                object_id      = string
                identifier_uri = optional(string)
                tenant_id      = optional(string)
            })))
        })))
  }))
}
