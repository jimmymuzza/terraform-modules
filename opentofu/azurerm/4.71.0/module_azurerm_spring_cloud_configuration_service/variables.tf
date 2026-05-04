variable "spring_cloud_configuration_services" {
  description = <<EOT
Map of spring_cloud_configuration_services, attributes below
Required:
    - name
    - spring_cloud_service_id
Optional:
    - generation
    - refresh_interval_in_seconds
    - repository
EOT

  type = map(object({
    name                        = string
    spring_cloud_service_id     = string
    generation                  = optional(string)
    refresh_interval_in_seconds = optional(number)
    repository                  = optional(list(object({
            label                    = string
            name                     = string
            patterns                 = set(string)
            uri                      = string
            ca_certificate_id        = optional(string)
            host_key                 = optional(string)
            host_key_algorithm       = optional(string)
            password                 = optional(string)
            private_key              = optional(string)
            search_paths             = optional(set(string))
            strict_host_key_checking = optional(bool)
            username                 = optional(string)
        })))
  }))
}
