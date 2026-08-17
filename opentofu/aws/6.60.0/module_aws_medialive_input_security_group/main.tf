resource "aws_medialive_input_security_group" "medialive_input_security_groups" {
  for_each = var.medialive_input_security_groups

  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "whitelist_rules" {
    for_each = each.value.whitelist_rules != null ? each.value.whitelist_rules : []
    content {
      cidr = whitelist_rules.value.cidr
    }
  }
}
