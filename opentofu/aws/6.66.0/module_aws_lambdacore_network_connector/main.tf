resource "aws_lambdacore_network_connector" "lambdacore_network_connectors" {
  for_each = var.lambdacore_network_connectors

  name          = each.value.name
  operator_role = each.value.operator_role
  region        = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "vpc_egress_configuration" {
        for_each = configuration.value.vpc_egress_configuration != null ? configuration.value.vpc_egress_configuration : []
        content {
          associated_compute_resource_types = vpc_egress_configuration.value.associated_compute_resource_types
          security_group_ids                = vpc_egress_configuration.value.security_group_ids
          subnet_ids                        = vpc_egress_configuration.value.subnet_ids
          network_protocol                  = vpc_egress_configuration.value.network_protocol
        }
      }
    }
  }
}
