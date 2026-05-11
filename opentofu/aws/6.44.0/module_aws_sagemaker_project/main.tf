resource "aws_sagemaker_project" "sagemaker_projects" {
  for_each = var.sagemaker_projects

  project_name        = each.value.project_name
  project_description = each.value.project_description
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "service_catalog_provisioning_details" {
    for_each = each.value.service_catalog_provisioning_details != null ? each.value.service_catalog_provisioning_details : []
    content {
      product_id               = service_catalog_provisioning_details.value.product_id
      path_id                  = service_catalog_provisioning_details.value.path_id
      provisioning_artifact_id = service_catalog_provisioning_details.value.provisioning_artifact_id

      dynamic "provisioning_parameter" {
        for_each = service_catalog_provisioning_details.value.provisioning_parameter != null ? service_catalog_provisioning_details.value.provisioning_parameter : []
        content {
          key   = provisioning_parameter.value.key
          value = provisioning_parameter.value.value
        }
      }
    }
  }
}
