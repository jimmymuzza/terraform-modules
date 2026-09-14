variable "opensearch_inbound_connection_accepters" {
  description = <<EOT
Map of opensearch_inbound_connection_accepters, attributes below
Required:
    - connection_id
Optional:
    - region
EOT

  type = map(object({
    connection_id = string
    region        = optional(string)
  }))
}
