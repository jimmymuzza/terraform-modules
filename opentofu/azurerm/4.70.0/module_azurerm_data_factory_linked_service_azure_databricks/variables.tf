variable "data_factory_linked_service_azure_databricks" {
  description = <<EOT
Map of data_factory_linked_service_azure_databricks, attributes below
Required:
    - adb_domain
    - data_factory_id
    - name
Optional:
    - access_token
    - additional_properties
    - annotations
    - description
    - existing_cluster_id
    - integration_runtime_name
    - msi_work_space_resource_id
    - msi_workspace_id
    - parameters
    - instance_pool
    - key_vault_password
    - new_cluster_config
EOT

  type = map(object({
    adb_domain                 = string
    data_factory_id            = string
    name                       = string
    access_token               = optional(string)
    additional_properties      = optional(map(string))
    annotations                = optional(list(string))
    description                = optional(string)
    existing_cluster_id        = optional(string)
    integration_runtime_name   = optional(string)
    msi_work_space_resource_id = optional(string)
    msi_workspace_id           = optional(string)
    parameters                 = optional(map(string))
    instance_pool              = optional(list(object({
            cluster_version       = string
            instance_pool_id      = string
            max_number_of_workers = optional(number)
            min_number_of_workers = optional(number)
        })))
    key_vault_password         = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    new_cluster_config         = optional(list(object({
            cluster_version             = string
            node_type                   = string
            custom_tags                 = optional(map(string))
            driver_node_type            = optional(string)
            init_scripts                = optional(list(string))
            log_destination             = optional(string)
            max_number_of_workers       = optional(number)
            min_number_of_workers       = optional(number)
            spark_config                = optional(map(string))
            spark_environment_variables = optional(map(string))
        })))
  }))
}
