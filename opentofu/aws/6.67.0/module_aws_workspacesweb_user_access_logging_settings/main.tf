resource "aws_workspacesweb_user_access_logging_settings" "workspacesweb_user_access_logging_settings" {
  for_each = var.workspacesweb_user_access_logging_settings

  kinesis_stream_arn = each.value.kinesis_stream_arn
  region             = each.value.region
  tags               = each.value.tags
}
