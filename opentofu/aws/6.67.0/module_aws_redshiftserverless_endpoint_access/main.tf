resource "aws_redshiftserverless_endpoint_access" "redshiftserverless_endpoint_accesses" {
  for_each = var.redshiftserverless_endpoint_accesses

  endpoint_name          = each.value.endpoint_name
  subnet_ids             = each.value.subnet_ids
  workgroup_name         = each.value.workgroup_name
  owner_account          = each.value.owner_account
  region                 = each.value.region
  vpc_security_group_ids = each.value.vpc_security_group_ids
}
