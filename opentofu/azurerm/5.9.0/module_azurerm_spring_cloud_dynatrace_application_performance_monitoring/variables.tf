variable "spring_cloud_dynatrace_application_performance_monitorings" {
  description = <<EOT
Map of spring_cloud_dynatrace_application_performance_monitorings, attributes below
Required:
    - connection_point
    - name
    - spring_cloud_service_id
    - tenant
    - tenant_token
Optional:
    - api_token
    - api_url
    - environment_id
    - globally_enabled
EOT

  type = map(object({
    connection_point        = string
    name                    = string
    spring_cloud_service_id = string
    tenant                  = string
    tenant_token            = string
    api_token               = optional(string)
    api_url                 = optional(string)
    environment_id          = optional(string)
    globally_enabled        = optional(bool)
  }))
}
