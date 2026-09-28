variable "spring_cloud_application_live_views" {
  description = <<EOT
Map of spring_cloud_application_live_views, attributes below
Required:
    - name
    - spring_cloud_service_id
EOT

  type = map(object({
    name                    = string
    spring_cloud_service_id = string
  }))
}
