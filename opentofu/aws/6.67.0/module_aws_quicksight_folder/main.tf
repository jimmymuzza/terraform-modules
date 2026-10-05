resource "aws_quicksight_folder" "quicksight_folders" {
  for_each = var.quicksight_folders

  folder_id         = each.value.folder_id
  aws_account_id    = each.value.aws_account_id
  folder_type       = each.value.folder_type
  name              = each.value.name
  parent_folder_arn = each.value.parent_folder_arn
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      actions   = permissions.value.actions
      principal = permissions.value.principal
    }
  }
}
