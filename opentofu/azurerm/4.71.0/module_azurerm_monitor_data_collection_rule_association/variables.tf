variable "monitor_data_collection_rule_associations" {
  description = <<EOT
Map of monitor_data_collection_rule_associations, attributes below
Required:
    - target_resource_id
Optional:
    - data_collection_endpoint_id
    - data_collection_rule_id
    - description
    - name
EOT

  type = map(object({
    target_resource_id          = string
    data_collection_endpoint_id = optional(string)
    data_collection_rule_id     = optional(string)
    description                 = optional(string)
    name                        = optional(string)
  }))
}
