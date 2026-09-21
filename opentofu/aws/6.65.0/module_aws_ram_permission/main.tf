resource "aws_ram_permission" "ram_permissions" {
  for_each = var.ram_permissions

  name            = each.value.name
  policy_template = each.value.policy_template
  resource_type   = each.value.resource_type
  region          = each.value.region
  tags            = each.value.tags
}
