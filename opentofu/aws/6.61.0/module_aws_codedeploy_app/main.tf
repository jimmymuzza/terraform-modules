resource "aws_codedeploy_app" "codedeploy_apps" {
  for_each = var.codedeploy_apps

  name             = each.value.name
  compute_platform = each.value.compute_platform
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
