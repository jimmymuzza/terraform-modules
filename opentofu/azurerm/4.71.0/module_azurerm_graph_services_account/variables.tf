variable "graph_services_accounts" {
  description = <<EOT
Map of graph_services_accounts, attributes below
Required:
    - application_id
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    application_id      = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
