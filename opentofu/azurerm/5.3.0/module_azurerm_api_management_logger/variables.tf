variable "api_management_loggers" {
  description = <<EOT
Map of api_management_loggers, attributes below
Required:
    - api_management_name
    - name
    - resource_group_name
Optional:
    - buffered
    - description
    - resource_id
    - application_insights
    - eventhub
EOT

  type = map(object({
    api_management_name  = string
    name                 = string
    resource_group_name  = string
    buffered             = optional(bool)
    description          = optional(string)
    resource_id          = optional(string)
    application_insights = optional(list(object({
            connection_string   = optional(string)
            identity_client_id  = optional(string)
            instrumentation_key = optional(string)
        })))
    eventhub             = optional(list(object({
            name                             = string
            connection_string                = optional(string)
            endpoint_uri                     = optional(string)
            user_assigned_identity_client_id = optional(string)
        })))
  }))
}
