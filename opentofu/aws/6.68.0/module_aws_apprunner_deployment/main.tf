resource "aws_apprunner_deployment" "apprunner_deployments" {
  for_each = var.apprunner_deployments

  service_arn = each.value.service_arn
  region      = each.value.region
}
