resource "aws_datazone_project" "datazone_projects" {
  for_each = var.datazone_projects

  domain_identifier   = each.value.domain_identifier
  name                = each.value.name
  description         = each.value.description
  glossary_terms      = each.value.glossary_terms
  region              = each.value.region
  skip_deletion_check = each.value.skip_deletion_check
}
