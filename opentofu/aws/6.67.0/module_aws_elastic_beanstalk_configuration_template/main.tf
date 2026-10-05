resource "aws_elastic_beanstalk_configuration_template" "elastic_beanstalk_configuration_templates" {
  for_each = var.elastic_beanstalk_configuration_templates

  application         = each.value.application
  name                = each.value.name
  description         = each.value.description
  environment_id      = each.value.environment_id
  region              = each.value.region
  solution_stack_name = each.value.solution_stack_name

  dynamic "setting" {
    for_each = each.value.setting != null ? each.value.setting : []
    content {
      name      = setting.value.name
      namespace = setting.value.namespace
      value     = setting.value.value
      resource  = setting.value.resource
    }
  }
}
