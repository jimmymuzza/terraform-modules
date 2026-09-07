variable "spring_cloud_application_insights_application_performance_monitorings" {
  description = <<EOT
Map of spring_cloud_application_insights_application_performance_monitorings, attributes below
Required:
    - name
    - spring_cloud_service_id
Optional:
    - connection_string
    - globally_enabled
    - role_instance
    - role_name
    - sampling_percentage
    - sampling_requests_per_second
EOT

  type = map(object({
    name                         = string
    spring_cloud_service_id      = string
    connection_string            = optional(string)
    globally_enabled             = optional(bool)
    role_instance                = optional(string)
    role_name                    = optional(string)
    sampling_percentage          = optional(number)
    sampling_requests_per_second = optional(number)
  }))
}
