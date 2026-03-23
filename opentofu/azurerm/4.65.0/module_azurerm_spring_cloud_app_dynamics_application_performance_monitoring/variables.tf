variable "spring_cloud_app_dynamics_application_performance_monitorings" {
  description = <<EOT
Map of spring_cloud_app_dynamics_application_performance_monitorings, attributes below
Required:
    - agent_account_access_key
    - agent_account_name
    - controller_host_name
    - name
    - spring_cloud_service_id
Optional:
    - agent_application_name
    - agent_node_name
    - agent_tier_name
    - agent_unique_host_id
    - controller_port
    - controller_ssl_enabled
    - globally_enabled
EOT

  type = map(object({
    agent_account_access_key = string
    agent_account_name       = string
    controller_host_name     = string
    name                     = string
    spring_cloud_service_id  = string
    agent_application_name   = optional(string)
    agent_node_name          = optional(string)
    agent_tier_name          = optional(string)
    agent_unique_host_id     = optional(string)
    controller_port          = optional(number)
    controller_ssl_enabled   = optional(bool)
    globally_enabled         = optional(bool)
  }))
}
