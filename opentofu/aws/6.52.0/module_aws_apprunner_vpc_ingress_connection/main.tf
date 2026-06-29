resource "aws_apprunner_vpc_ingress_connection" "apprunner_vpc_ingress_connections" {
  for_each = var.apprunner_vpc_ingress_connections

  name        = each.value.name
  service_arn = each.value.service_arn
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "ingress_vpc_configuration" {
    for_each = each.value.ingress_vpc_configuration != null ? each.value.ingress_vpc_configuration : []
    content {
      vpc_endpoint_id = ingress_vpc_configuration.value.vpc_endpoint_id
      vpc_id          = ingress_vpc_configuration.value.vpc_id
    }
  }
}
