resource "aws_config_conformance_pack" "config_conformance_packs" {
  for_each = var.config_conformance_packs

  name                   = each.value.name
  delivery_s3_bucket     = each.value.delivery_s3_bucket
  delivery_s3_key_prefix = each.value.delivery_s3_key_prefix
  region                 = each.value.region
  template_body          = each.value.template_body
  template_s3_uri        = each.value.template_s3_uri

  dynamic "input_parameter" {
    for_each = each.value.input_parameter != null ? each.value.input_parameter : []
    content {
      parameter_name  = input_parameter.value.parameter_name
      parameter_value = input_parameter.value.parameter_value
    }
  }
}
