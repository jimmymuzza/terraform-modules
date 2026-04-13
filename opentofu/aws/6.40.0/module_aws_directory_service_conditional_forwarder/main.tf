resource "aws_directory_service_conditional_forwarder" "directory_service_conditional_forwarders" {
  for_each = var.directory_service_conditional_forwarders

  directory_id       = each.value.directory_id
  dns_ips            = each.value.dns_ips
  remote_domain_name = each.value.remote_domain_name
  region             = each.value.region
}
