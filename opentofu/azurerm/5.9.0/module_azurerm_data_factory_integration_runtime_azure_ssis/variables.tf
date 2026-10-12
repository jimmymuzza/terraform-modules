variable "data_factory_integration_runtime_azure_ssis" {
  description = <<EOT
Map of data_factory_integration_runtime_azure_ssis, attributes below
Required:
    - data_factory_id
    - location
    - name
    - node_size
Optional:
    - credential_name
    - description
    - edition
    - license_type
    - max_parallel_executions_per_node
    - number_of_nodes
    - catalog_info
    - copy_compute_scale
    - custom_setup_script
    - express_custom_setup
    - express_vnet_integration
    - package_store
    - pipeline_external_compute_scale
    - proxy
    - vnet_integration
EOT

  type = map(object({
    data_factory_id                  = string
    location                         = string
    name                             = string
    node_size                        = string
    credential_name                  = optional(string)
    description                      = optional(string)
    edition                          = optional(string)
    license_type                     = optional(string)
    max_parallel_executions_per_node = optional(number)
    number_of_nodes                  = optional(number)
    catalog_info                     = optional(list(object({
            server_endpoint        = string
            administrator_login    = optional(string)
            administrator_password = optional(string)
            dual_standby_pair_name = optional(string)
            elastic_pool_name      = optional(string)
            pricing_tier           = optional(string)
        })))
    copy_compute_scale               = optional(list(object({
            data_integration_unit = optional(number)
            time_to_live          = optional(number)
        })))
    custom_setup_script              = optional(list(object({
            blob_container_uri = string
            sas_token          = string
        })))
    express_custom_setup             = optional(list(object({
            environment        = optional(map(string))
            powershell_version = optional(string)
            command_key        = optional(list(object({
                target_name        = string
                user_name          = string
                password           = optional(string)
                key_vault_password = optional(list(object({
                    linked_service_name = string
                    secret_name         = string
                    parameters          = optional(map(string))
                    secret_version      = optional(string)
                })))
            })))
            component          = optional(list(object({
                name              = string
                license           = optional(string)
                key_vault_license = optional(list(object({
                    linked_service_name = string
                    secret_name         = string
                    parameters          = optional(map(string))
                    secret_version      = optional(string)
                })))
            })))
        })))
    express_vnet_integration         = optional(list(object({
            subnet_id = string
        })))
    package_store                    = optional(list(object({
            linked_service_name = string
            name                = string
        })))
    pipeline_external_compute_scale  = optional(list(object({
            number_of_external_nodes = optional(number)
            number_of_pipeline_nodes = optional(number)
            time_to_live             = optional(number)
        })))
    proxy                            = optional(list(object({
            self_hosted_integration_runtime_name = string
            staging_storage_linked_service_name  = string
            path                                 = optional(string)
        })))
    vnet_integration                 = optional(list(object({
            public_ips  = optional(list(string))
            subnet_id   = optional(string)
            subnet_name = optional(string)
            vnet_id     = optional(string)
        })))
  }))
}
