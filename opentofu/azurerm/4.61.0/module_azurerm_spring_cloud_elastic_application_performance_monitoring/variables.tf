variable "spring_cloud_elastic_application_performance_monitorings" {
  description = <<EOT
Map of spring_cloud_elastic_application_performance_monitorings, attributes below
Required:
    - application_packages
    - name
    - server_url
    - service_name
    - spring_cloud_service_id
Optional:
    - globally_enabled
EOT

  type = map(object({
    application_packages    = list(string)
    name                    = string
    server_url              = string
    service_name            = string
    spring_cloud_service_id = string
    globally_enabled        = optional(bool)
  }))
}
