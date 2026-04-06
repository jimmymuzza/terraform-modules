resource "aws_servicecatalog_product" "servicecatalog_products" {
  for_each = var.servicecatalog_products

  name                = each.value.name
  owner               = each.value.owner
  type                = each.value.type
  accept_language     = each.value.accept_language
  description         = each.value.description
  distributor         = each.value.distributor
  region              = each.value.region
  support_description = each.value.support_description
  support_email       = each.value.support_email
  support_url         = each.value.support_url
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "provisioning_artifact_parameters" {
    for_each = each.value.provisioning_artifact_parameters != null ? each.value.provisioning_artifact_parameters : []
    content {
      description                 = provisioning_artifact_parameters.value.description
      disable_template_validation = provisioning_artifact_parameters.value.disable_template_validation
      name                        = provisioning_artifact_parameters.value.name
      template_physical_id        = provisioning_artifact_parameters.value.template_physical_id
      template_url                = provisioning_artifact_parameters.value.template_url
      type                        = provisioning_artifact_parameters.value.type
    }
  }
}
