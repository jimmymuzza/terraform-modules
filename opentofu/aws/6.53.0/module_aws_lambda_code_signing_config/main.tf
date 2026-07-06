resource "aws_lambda_code_signing_config" "lambda_code_signing_configs" {
  for_each = var.lambda_code_signing_configs

  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "allowed_publishers" {
    for_each = each.value.allowed_publishers != null ? each.value.allowed_publishers : []
    content {
      signing_profile_version_arns = allowed_publishers.value.signing_profile_version_arns
    }
  }

  dynamic "policies" {
    for_each = each.value.policies != null ? each.value.policies : []
    content {
      untrusted_artifact_on_deployment = policies.value.untrusted_artifact_on_deployment
    }
  }
}
