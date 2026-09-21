resource "aws_iam_security_token_service_preferences" "iam_security_token_service_preferences" {
  for_each = var.iam_security_token_service_preferences

  global_endpoint_token_version = each.value.global_endpoint_token_version
}
