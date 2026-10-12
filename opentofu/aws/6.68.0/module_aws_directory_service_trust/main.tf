resource "aws_directory_service_trust" "directory_service_trusts" {
  for_each = var.directory_service_trusts

  directory_id                            = each.value.directory_id
  remote_domain_name                      = each.value.remote_domain_name
  trust_direction                         = each.value.trust_direction
  trust_password                          = each.value.trust_password
  conditional_forwarder_ip_addrs          = each.value.conditional_forwarder_ip_addrs
  delete_associated_conditional_forwarder = each.value.delete_associated_conditional_forwarder
  region                                  = each.value.region
  selective_auth                          = each.value.selective_auth
  trust_type                              = each.value.trust_type
}
