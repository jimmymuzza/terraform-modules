resource "aws_servicequotas_template" "servicequotas_templates" {
  for_each = var.servicequotas_templates

  quota_code   = each.value.quota_code
  service_code = each.value.service_code
  value        = each.value.value
  aws_region   = each.value.aws_region
  region       = each.value.region
}
