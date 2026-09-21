resource "aws_workspacesweb_session_logger_association" "workspacesweb_session_logger_associations" {
  for_each = var.workspacesweb_session_logger_associations

  portal_arn         = each.value.portal_arn
  session_logger_arn = each.value.session_logger_arn
  region             = each.value.region
}
