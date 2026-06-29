variable "log_analytics_saved_searches" {
  description = <<EOT
Map of log_analytics_saved_searches, attributes below
Required:
    - category
    - display_name
    - log_analytics_workspace_id
    - name
    - query
Optional:
    - function_alias
    - function_parameters
    - tags
EOT

  type = map(object({
    category                   = string
    display_name               = string
    log_analytics_workspace_id = string
    name                       = string
    query                      = string
    function_alias             = optional(string)
    function_parameters        = optional(list(string))
    tags                       = optional(map(string))
  }))
}
