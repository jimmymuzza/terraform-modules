resource "aws_directory_service_radius_settings" "directory_service_radius_settings" {
  for_each = var.directory_service_radius_settings

  authentication_protocol = each.value.authentication_protocol
  directory_id            = each.value.directory_id
  display_label           = each.value.display_label
  radius_port             = each.value.radius_port
  radius_retries          = each.value.radius_retries
  radius_servers          = each.value.radius_servers
  radius_timeout          = each.value.radius_timeout
  shared_secret           = each.value.shared_secret
  region                  = each.value.region
  use_same_username       = each.value.use_same_username
}
