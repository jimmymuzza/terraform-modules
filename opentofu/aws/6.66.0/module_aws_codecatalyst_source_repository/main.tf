resource "aws_codecatalyst_source_repository" "codecatalyst_source_repositories" {
  for_each = var.codecatalyst_source_repositories

  name         = each.value.name
  project_name = each.value.project_name
  space_name   = each.value.space_name
  description  = each.value.description
  region       = each.value.region
}
