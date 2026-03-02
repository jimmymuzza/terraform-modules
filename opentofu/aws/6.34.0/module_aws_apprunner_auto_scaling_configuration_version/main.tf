resource "aws_apprunner_auto_scaling_configuration_version" "apprunner_auto_scaling_configuration_versions" {
  for_each = var.apprunner_auto_scaling_configuration_versions

  auto_scaling_configuration_name = each.value.auto_scaling_configuration_name
  max_concurrency                 = each.value.max_concurrency
  max_size                        = each.value.max_size
  min_size                        = each.value.min_size
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
