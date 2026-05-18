resource "aws_mq_configuration" "mq_configurations" {
  for_each = var.mq_configurations

  data                    = each.value.data
  engine_type             = each.value.engine_type
  engine_version          = each.value.engine_version
  name                    = each.value.name
  authentication_strategy = each.value.authentication_strategy
  description             = each.value.description
  region                  = each.value.region
  skip_destroy            = each.value.skip_destroy
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
}
