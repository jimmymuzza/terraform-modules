resource "aws_fsx_ontap_storage_virtual_machine" "fsx_ontap_storage_virtual_machines" {
  for_each = var.fsx_ontap_storage_virtual_machines

  file_system_id             = each.value.file_system_id
  name                       = each.value.name
  region                     = each.value.region
  root_volume_security_style = each.value.root_volume_security_style
  svm_admin_password         = each.value.svm_admin_password
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "active_directory_configuration" {
    for_each = each.value.active_directory_configuration != null ? each.value.active_directory_configuration : []
    content {
      netbios_name = active_directory_configuration.value.netbios_name

      dynamic "self_managed_active_directory_configuration" {
        for_each = active_directory_configuration.value.self_managed_active_directory_configuration != null ? active_directory_configuration.value.self_managed_active_directory_configuration : []
        content {
          dns_ips                                = self_managed_active_directory_configuration.value.dns_ips
          domain_name                            = self_managed_active_directory_configuration.value.domain_name
          password                               = self_managed_active_directory_configuration.value.password
          username                               = self_managed_active_directory_configuration.value.username
          file_system_administrators_group       = self_managed_active_directory_configuration.value.file_system_administrators_group
          organizational_unit_distinguished_name = self_managed_active_directory_configuration.value.organizational_unit_distinguished_name
        }
      }
    }
  }
}
