variable "spring_cloud_java_deployments" {
  description = <<EOT
Map of spring_cloud_java_deployments, attributes below
Required:
    - name
    - spring_cloud_app_id
Optional:
    - environment_variables
    - instance_count
    - jvm_options
    - runtime_version
    - quota
EOT

  type = map(object({
    name                  = string
    spring_cloud_app_id   = string
    environment_variables = optional(map(string))
    instance_count        = optional(number)
    jvm_options           = optional(string)
    runtime_version       = optional(string)
    quota                 = optional(list(object({
            cpu    = optional(string)
            memory = optional(string)
        })))
  }))
}
