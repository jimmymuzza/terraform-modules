resource "aws_rekognition_project" "rekognition_projects" {
  for_each = var.rekognition_projects

  name        = each.value.name
  auto_update = each.value.auto_update
  feature     = each.value.feature
  region      = each.value.region
  tags        = each.value.tags
}
