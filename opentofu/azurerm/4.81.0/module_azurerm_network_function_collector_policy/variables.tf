variable "network_function_collector_policies" {
  description = <<EOT
Map of network_function_collector_policies, attributes below
Required:
    - location
    - name
    - traffic_collector_id
    - ipfx_emission
    - ipfx_ingestion
Optional:
    - tags
EOT

  type = map(object({
    location             = string
    name                 = string
    traffic_collector_id = string
    tags                 = optional(map(string))
    ipfx_emission        = list(object({
            destination_types = list(string)
        }))
    ipfx_ingestion       = list(object({
            source_resource_ids = set(string)
        }))
  }))
}
