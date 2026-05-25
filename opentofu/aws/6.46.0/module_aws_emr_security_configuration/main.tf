resource "aws_emr_security_configuration" "emr_security_configurations" {
  for_each = var.emr_security_configurations

  configuration = each.value.configuration
  name          = each.value.name
  name_prefix   = each.value.name_prefix
  region        = each.value.region
}
