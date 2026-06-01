resource "aws_appstream_directory_config" "appstream_directory_configs" {
  for_each = var.appstream_directory_configs

  directory_name                          = each.value.directory_name
  organizational_unit_distinguished_names = each.value.organizational_unit_distinguished_names
  region                                  = each.value.region

  dynamic "certificate_based_auth_properties" {
    for_each = each.value.certificate_based_auth_properties != null ? each.value.certificate_based_auth_properties : []
    content {
      certificate_authority_arn = certificate_based_auth_properties.value.certificate_authority_arn
      status                    = certificate_based_auth_properties.value.status
    }
  }

  dynamic "service_account_credentials" {
    for_each = each.value.service_account_credentials != null ? each.value.service_account_credentials : []
    content {
      account_name     = service_account_credentials.value.account_name
      account_password = service_account_credentials.value.account_password
    }
  }
}
