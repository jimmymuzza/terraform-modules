variable "spring_cloud_container_deployments" {
  description = <<EOT
Map of spring_cloud_container_deployments, attributes below
Required:
    - image
    - name
    - server
    - spring_cloud_app_id
Optional:
    - addon_json
    - application_performance_monitoring_ids
    - arguments
    - commands
    - environment_variables
    - instance_count
    - language_framework
    - quota
EOT

  type = map(object({
    image                                  = string
    name                                   = string
    server                                 = string
    spring_cloud_app_id                    = string
    addon_json                             = optional(string)
    application_performance_monitoring_ids = optional(list(string))
    arguments                              = optional(list(string))
    commands                               = optional(list(string))
    environment_variables                  = optional(map(string))
    instance_count                         = optional(number)
    language_framework                     = optional(string)
    quota                                  = optional(list(object({
            cpu    = optional(string)
            memory = optional(string)
        })))
  }))
}
