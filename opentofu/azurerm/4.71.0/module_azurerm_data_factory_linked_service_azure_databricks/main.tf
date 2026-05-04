resource "azurerm_data_factory_linked_service_azure_databricks" "data_factory_linked_service_azure_databricks" {
  for_each = var.data_factory_linked_service_azure_databricks

  adb_domain                 = each.value.adb_domain
  data_factory_id            = each.value.data_factory_id
  name                       = each.value.name
  access_token               = each.value.access_token
  additional_properties      = each.value.additional_properties
  annotations                = each.value.annotations
  description                = each.value.description
  existing_cluster_id        = each.value.existing_cluster_id
  integration_runtime_name   = each.value.integration_runtime_name
  msi_work_space_resource_id = each.value.msi_work_space_resource_id
  msi_workspace_id           = each.value.msi_workspace_id
  parameters                 = each.value.parameters

  dynamic "instance_pool" {
    for_each = each.value.instance_pool != null ? each.value.instance_pool : []
    content {
      cluster_version       = instance_pool.value.cluster_version
      instance_pool_id      = instance_pool.value.instance_pool_id
      max_number_of_workers = instance_pool.value.max_number_of_workers
      min_number_of_workers = instance_pool.value.min_number_of_workers
    }
  }

  dynamic "key_vault_password" {
    for_each = each.value.key_vault_password != null ? each.value.key_vault_password : []
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }

  dynamic "new_cluster_config" {
    for_each = each.value.new_cluster_config != null ? each.value.new_cluster_config : []
    content {
      cluster_version             = new_cluster_config.value.cluster_version
      node_type                   = new_cluster_config.value.node_type
      custom_tags                 = new_cluster_config.value.custom_tags
      driver_node_type            = new_cluster_config.value.driver_node_type
      init_scripts                = new_cluster_config.value.init_scripts
      log_destination             = new_cluster_config.value.log_destination
      max_number_of_workers       = new_cluster_config.value.max_number_of_workers
      min_number_of_workers       = new_cluster_config.value.min_number_of_workers
      spark_config                = new_cluster_config.value.spark_config
      spark_environment_variables = new_cluster_config.value.spark_environment_variables
    }
  }
}
