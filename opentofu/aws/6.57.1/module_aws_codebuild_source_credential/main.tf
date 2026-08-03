resource "aws_codebuild_source_credential" "codebuild_source_credentials" {
  for_each = var.codebuild_source_credentials

  auth_type   = each.value.auth_type
  server_type = each.value.server_type
  token       = each.value.token
  region      = each.value.region
  user_name   = each.value.user_name
}
