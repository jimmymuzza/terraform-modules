resource "aws_m2_deployment" "m2_deployments" {
  for_each = var.m2_deployments

  application_id      = each.value.application_id
  application_version = each.value.application_version
  environment_id      = each.value.environment_id
  start               = each.value.start
  force_stop          = each.value.force_stop
  region              = each.value.region
}
