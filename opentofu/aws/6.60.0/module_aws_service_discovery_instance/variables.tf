variable "service_discovery_instances" {
  description = <<EOT
Map of service_discovery_instances, attributes below
Required:
    - attributes
    - instance_id
    - service_id
Optional:
    - region
EOT

  type = map(object({
    attributes  = map(string)
    instance_id = string
    service_id  = string
    region      = optional(string)
  }))
}
