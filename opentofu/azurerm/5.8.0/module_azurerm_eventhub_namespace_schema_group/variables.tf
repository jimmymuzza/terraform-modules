variable "eventhub_namespace_schema_groups" {
  description = <<EOT
Map of eventhub_namespace_schema_groups, attributes below
Required:
    - name
    - namespace_id
    - schema_compatibility
    - schema_type
EOT

  type = map(object({
    name                 = string
    namespace_id         = string
    schema_compatibility = string
    schema_type          = string
  }))
}
