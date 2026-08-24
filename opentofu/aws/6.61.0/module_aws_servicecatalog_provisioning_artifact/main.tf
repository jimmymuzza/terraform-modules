resource "aws_servicecatalog_provisioning_artifact" "servicecatalog_provisioning_artifacts" {
  for_each = var.servicecatalog_provisioning_artifacts

  product_id                  = each.value.product_id
  accept_language             = each.value.accept_language
  active                      = each.value.active
  description                 = each.value.description
  disable_template_validation = each.value.disable_template_validation
  guidance                    = each.value.guidance
  name                        = each.value.name
  region                      = each.value.region
  template_physical_id        = each.value.template_physical_id
  template_url                = each.value.template_url
  type                        = each.value.type
}
