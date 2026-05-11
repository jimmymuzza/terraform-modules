variable "msk_configurations" {
  description = <<EOT
Map of msk_configurations, attributes below
Required:
    - name
    - server_properties
Optional:
    - description
    - kafka_versions
    - region
EOT

  type = map(object({
    name              = string
    server_properties = string
    description       = optional(string)
    kafka_versions    = optional(set(string))
    region            = optional(string)
  }))
}
