variable "spring_cloud_build_deployments" {
  description = <<EOT
Map of spring_cloud_build_deployments, attributes below
Required:
    - build_result_id
    - name
    - spring_cloud_app_id
Optional:
    - addon_json
    - application_performance_monitoring_ids
    - environment_variables
    - instance_count
    - quota
EOT

  type = map(object({
    build_result_id                        = string
    name                                   = string
    spring_cloud_app_id                    = string
    addon_json                             = optional(string)
    application_performance_monitoring_ids = optional(list(string))
    environment_variables                  = optional(map(string))
    instance_count                         = optional(number)
    quota                                  = optional(list(object({
            cpu    = optional(string)
            memory = optional(string)
        })))
  }))
}
