resource "aws_apprunner_default_auto_scaling_configuration_version" "apprunner_default_auto_scaling_configuration_versions" {
  for_each = var.apprunner_default_auto_scaling_configuration_versions

  auto_scaling_configuration_arn = each.value.auto_scaling_configuration_arn
  region                         = each.value.region
}
