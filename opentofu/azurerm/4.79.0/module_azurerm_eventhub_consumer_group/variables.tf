variable "eventhub_consumer_groups" {
  description = <<EOT
Map of eventhub_consumer_groups, attributes below
Required:
    - eventhub_name
    - name
    - namespace_name
    - resource_group_name
Optional:
    - user_metadata
EOT

  type = map(object({
    eventhub_name       = string
    name                = string
    namespace_name      = string
    resource_group_name = string
    user_metadata       = optional(string)
  }))
}
