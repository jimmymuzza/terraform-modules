variable "eventgrid_system_topics" {
  description = <<EOT
Map of eventgrid_system_topics, attributes below
Required:
    - location
    - name
    - resource_group_name
    - source_resource_id
    - topic_type
Optional:
    - tags
    - identity
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    source_resource_id  = string
    topic_type          = string
    tags                = optional(map(string))
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
