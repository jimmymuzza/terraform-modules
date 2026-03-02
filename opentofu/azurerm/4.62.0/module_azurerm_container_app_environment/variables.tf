variable "container_app_environments" {
  description = <<EOT
Map of container_app_environments, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - dapr_application_insights_connection_string
    - infrastructure_resource_group_name
    - infrastructure_subnet_id
    - internal_load_balancer_enabled
    - log_analytics_workspace_id
    - logs_destination
    - mutual_tls_enabled
    - public_network_access
    - tags
    - zone_redundancy_enabled
    - identity
    - workload_profile
EOT

  type = map(object({
    location                                    = string
    name                                        = string
    resource_group_name                         = string
    dapr_application_insights_connection_string = optional(string)
    infrastructure_resource_group_name          = optional(string)
    infrastructure_subnet_id                    = optional(string)
    internal_load_balancer_enabled              = optional(bool)
    log_analytics_workspace_id                  = optional(string)
    logs_destination                            = optional(string)
    mutual_tls_enabled                          = optional(bool)
    public_network_access                       = optional(string)
    tags                                        = optional(map(string))
    zone_redundancy_enabled                     = optional(bool)
    identity                                    = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    workload_profile                            = optional(set(object({
            name                  = string
            workload_profile_type = string
            maximum_count         = optional(number)
            minimum_count         = optional(number)
        })))
  }))
}
