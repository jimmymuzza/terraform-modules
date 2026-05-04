resource "aws_workspaces_connection_alias" "workspaces_connection_alias" {
  for_each = var.workspaces_connection_alias

  connection_string = each.value.connection_string
  region            = each.value.region
  tags              = each.value.tags
}
