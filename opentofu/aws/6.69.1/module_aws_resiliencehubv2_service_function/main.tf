resource "aws_resiliencehubv2_service_function" "resiliencehubv2_service_functions" {
  for_each = var.resiliencehubv2_service_functions

  criticality = each.value.criticality
  name        = each.value.name
  service_arn = each.value.service_arn
  description = each.value.description
  region      = each.value.region
}
