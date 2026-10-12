resource "aws_apprunner_vpc_connector" "apprunner_vpc_connectors" {
  for_each = var.apprunner_vpc_connectors

  security_groups    = each.value.security_groups
  subnets            = each.value.subnets
  vpc_connector_name = each.value.vpc_connector_name
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
