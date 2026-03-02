resource "aws_codecatalyst_project" "codecatalyst_projects" {
  for_each = var.codecatalyst_projects

  display_name = each.value.display_name
  space_name   = each.value.space_name
  description  = each.value.description
  region       = each.value.region
}
