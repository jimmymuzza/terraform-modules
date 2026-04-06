resource "aws_redshift_endpoint_authorization" "redshift_endpoint_authorizations" {
  for_each = var.redshift_endpoint_authorizations

  account            = each.value.account
  cluster_identifier = each.value.cluster_identifier
  force_delete       = each.value.force_delete
  region             = each.value.region
  vpc_ids            = each.value.vpc_ids
}
