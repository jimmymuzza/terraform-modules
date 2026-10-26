resource "aws_efs_mount_target" "efs_mount_targets" {
  for_each = var.efs_mount_targets

  file_system_id  = each.value.file_system_id
  subnet_id       = each.value.subnet_id
  ip_address      = each.value.ip_address
  ip_address_type = each.value.ip_address_type
  ipv6_address    = each.value.ipv6_address
  region          = each.value.region
  security_groups = each.value.security_groups
}
