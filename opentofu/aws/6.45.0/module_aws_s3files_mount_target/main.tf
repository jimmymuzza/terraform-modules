resource "aws_s3files_mount_target" "s3files_mount_targets" {
  for_each = var.s3files_mount_targets

  file_system_id  = each.value.file_system_id
  subnet_id       = each.value.subnet_id
  ip_address_type = each.value.ip_address_type
  ipv4_address    = each.value.ipv4_address
  ipv6_address    = each.value.ipv6_address
  region          = each.value.region
  security_groups = each.value.security_groups
}
