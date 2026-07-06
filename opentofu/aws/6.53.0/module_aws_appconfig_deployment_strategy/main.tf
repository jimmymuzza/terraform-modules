resource "aws_appconfig_deployment_strategy" "appconfig_deployment_strategies" {
  for_each = var.appconfig_deployment_strategies

  deployment_duration_in_minutes = each.value.deployment_duration_in_minutes
  growth_factor                  = each.value.growth_factor
  name                           = each.value.name
  replicate_to                   = each.value.replicate_to
  description                    = each.value.description
  final_bake_time_in_minutes     = each.value.final_bake_time_in_minutes
  growth_type                    = each.value.growth_type
  region                         = each.value.region
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
}
