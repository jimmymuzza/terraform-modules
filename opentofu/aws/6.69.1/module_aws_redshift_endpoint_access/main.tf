resource "aws_redshift_endpoint_access" "redshift_endpoint_accesses" {
  for_each = var.redshift_endpoint_accesses

  cluster_identifier     = each.value.cluster_identifier
  endpoint_name          = each.value.endpoint_name
  subnet_group_name      = each.value.subnet_group_name
  region                 = each.value.region
  resource_owner         = each.value.resource_owner
  vpc_security_group_ids = each.value.vpc_security_group_ids
}
