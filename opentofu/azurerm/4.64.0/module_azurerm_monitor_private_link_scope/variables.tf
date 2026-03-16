variable "monitor_private_link_scopes" {
  description = <<EOT
Map of monitor_private_link_scopes, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - ingestion_access_mode
    - query_access_mode
    - tags
EOT

  type = map(object({
    name                  = string
    resource_group_name   = string
    ingestion_access_mode = optional(string)
    query_access_mode     = optional(string)
    tags                  = optional(map(string))
  }))
}
