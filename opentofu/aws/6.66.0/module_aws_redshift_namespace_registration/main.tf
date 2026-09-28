resource "aws_redshift_namespace_registration" "redshift_namespace_registrations" {
  for_each = var.redshift_namespace_registrations

  consumer_identifier             = each.value.consumer_identifier
  namespace_type                  = each.value.namespace_type
  provisioned_cluster_identifier  = each.value.provisioned_cluster_identifier
  region                          = each.value.region
  serverless_namespace_identifier = each.value.serverless_namespace_identifier
  serverless_workgroup_identifier = each.value.serverless_workgroup_identifier
}
