resource "aws_amplify_backend_environment" "amplify_backend_environments" {
  for_each = var.amplify_backend_environments

  app_id               = each.value.app_id
  environment_name     = each.value.environment_name
  deployment_artifacts = each.value.deployment_artifacts
  region               = each.value.region
  stack_name           = each.value.stack_name
}
