variable "application_insights_workbooks" {
  description = <<EOT
Map of application_insights_workbooks, attributes below
Required:
    - data_json
    - display_name
    - location
    - name
    - resource_group_name
Optional:
    - category
    - description
    - source_id
    - storage_container_id
    - tags
    - identity
EOT

  type = map(object({
    data_json            = string
    display_name         = string
    location             = string
    name                 = string
    resource_group_name  = string
    category             = optional(string)
    description          = optional(string)
    source_id            = optional(string)
    storage_container_id = optional(string)
    tags                 = optional(map(string))
    identity             = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
