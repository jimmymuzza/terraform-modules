resource "aws_devicefarm_upload" "devicefarm_uploads" {
  for_each = var.devicefarm_uploads

  name         = each.value.name
  project_arn  = each.value.project_arn
  type         = each.value.type
  content_type = each.value.content_type
  region       = each.value.region
}
