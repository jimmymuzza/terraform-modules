resource "aws_ec2_serial_console_access" "ec2_serial_console_accesses" {
  for_each = var.ec2_serial_console_accesses

  enabled = each.value.enabled
  region  = each.value.region
}
