variable "resourcegroups_groups" {
  description = <<EOT
Map of resourcegroups_groups, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - configuration
    - resource_query
EOT

  type = map(object({
    name           = string
    description    = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    configuration  = optional(set(object({
            type       = string
            parameters = optional(set(object({
                name   = string
                values = list(string)
            })))
        })))
    resource_query = optional(list(object({
            query = string
            type  = optional(string)
        })))
  }))
}
