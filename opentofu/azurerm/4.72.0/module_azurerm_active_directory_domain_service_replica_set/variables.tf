variable "active_directory_domain_service_replica_sets" {
  description = <<EOT
Map of active_directory_domain_service_replica_sets, attributes below
Required:
    - domain_service_id
    - location
    - subnet_id
EOT

  type = map(object({
    domain_service_id = string
    location          = string
    subnet_id         = string
  }))
}
