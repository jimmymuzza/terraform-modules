variable "sentinel_watchlists" {
  description = <<EOT
Map of sentinel_watchlists, attributes below
Required:
    - display_name
    - item_search_key
    - log_analytics_workspace_id
    - name
Optional:
    - default_duration
    - description
    - labels
EOT

  type = map(object({
    display_name               = string
    item_search_key            = string
    log_analytics_workspace_id = string
    name                       = string
    default_duration           = optional(string)
    description                = optional(string)
    labels                     = optional(list(string))
  }))
}
