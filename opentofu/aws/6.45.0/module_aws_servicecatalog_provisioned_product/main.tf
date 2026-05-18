resource "aws_servicecatalog_provisioned_product" "servicecatalog_provisioned_products" {
  for_each = var.servicecatalog_provisioned_products

  name                       = each.value.name
  accept_language            = each.value.accept_language
  ignore_errors              = each.value.ignore_errors
  notification_arns          = each.value.notification_arns
  path_id                    = each.value.path_id
  path_name                  = each.value.path_name
  product_id                 = each.value.product_id
  product_name               = each.value.product_name
  provisioning_artifact_id   = each.value.provisioning_artifact_id
  provisioning_artifact_name = each.value.provisioning_artifact_name
  region                     = each.value.region
  retain_physical_resources  = each.value.retain_physical_resources
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "provisioning_parameters" {
    for_each = each.value.provisioning_parameters != null ? each.value.provisioning_parameters : []
    content {
      key                = provisioning_parameters.value.key
      use_previous_value = provisioning_parameters.value.use_previous_value
      value              = provisioning_parameters.value.value
    }
  }

  dynamic "stack_set_provisioning_preferences" {
    for_each = each.value.stack_set_provisioning_preferences != null ? each.value.stack_set_provisioning_preferences : []
    content {
      accounts                     = stack_set_provisioning_preferences.value.accounts
      failure_tolerance_count      = stack_set_provisioning_preferences.value.failure_tolerance_count
      failure_tolerance_percentage = stack_set_provisioning_preferences.value.failure_tolerance_percentage
      max_concurrency_count        = stack_set_provisioning_preferences.value.max_concurrency_count
      max_concurrency_percentage   = stack_set_provisioning_preferences.value.max_concurrency_percentage
      regions                      = stack_set_provisioning_preferences.value.regions
    }
  }
}
