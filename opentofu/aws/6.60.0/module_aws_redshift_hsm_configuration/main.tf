resource "aws_redshift_hsm_configuration" "redshift_hsm_configurations" {
  for_each = var.redshift_hsm_configurations

  description                   = each.value.description
  hsm_configuration_identifier  = each.value.hsm_configuration_identifier
  hsm_ip_address                = each.value.hsm_ip_address
  hsm_partition_name            = each.value.hsm_partition_name
  hsm_partition_password        = each.value.hsm_partition_password
  hsm_server_public_certificate = each.value.hsm_server_public_certificate
  region                        = each.value.region
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
}
