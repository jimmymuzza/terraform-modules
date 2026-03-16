resource "aws_securityhub_account" "securityhub_accounts" {
  for_each = var.securityhub_accounts

  auto_enable_controls      = each.value.auto_enable_controls
  control_finding_generator = each.value.control_finding_generator
  enable_default_standards  = each.value.enable_default_standards
  region                    = each.value.region
}
