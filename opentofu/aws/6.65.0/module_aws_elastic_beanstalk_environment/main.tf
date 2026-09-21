resource "aws_elastic_beanstalk_environment" "elastic_beanstalk_environments" {
  for_each = var.elastic_beanstalk_environments

  application            = each.value.application
  name                   = each.value.name
  cname_prefix           = each.value.cname_prefix
  description            = each.value.description
  platform_arn           = each.value.platform_arn
  poll_interval          = each.value.poll_interval
  region                 = each.value.region
  solution_stack_name    = each.value.solution_stack_name
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  template_name          = each.value.template_name
  tier                   = each.value.tier
  version_label          = each.value.version_label
  wait_for_ready_timeout = each.value.wait_for_ready_timeout

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
