resource "aws_codecommit_approval_rule_template_association" "codecommit_approval_rule_template_associations" {
  for_each = var.codecommit_approval_rule_template_associations

  approval_rule_template_name = each.value.approval_rule_template_name
  repository_name             = each.value.repository_name
  region                      = each.value.region
}
