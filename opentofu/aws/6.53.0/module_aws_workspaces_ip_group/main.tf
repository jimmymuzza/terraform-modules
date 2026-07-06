resource "aws_workspaces_ip_group" "workspaces_ip_groups" {
  for_each = var.workspaces_ip_groups

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "rules" {
    for_each = each.value.rules != null ? each.value.rules : []
    content {
      source      = rules.value.source
      description = rules.value.description
    }
  }
}
