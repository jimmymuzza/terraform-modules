resource "aws_codecommit_approval_rule_template" "codecommit_approval_rule_templates" {
  for_each = var.codecommit_approval_rule_templates

  content     = each.value.content
  name        = each.value.name
  description = each.value.description
  region      = each.value.region
}
