variable "application_insights_analytics_items" {
  description = <<EOT
Map of application_insights_analytics_items, attributes below
Required:
    - application_insights_id
    - content
    - name
    - scope
    - type
Optional:
    - function_alias
EOT

  type = map(object({
    application_insights_id = string
    content                 = string
    name                    = string
    scope                   = string
    type                    = string
    function_alias          = optional(string)
  }))
}
