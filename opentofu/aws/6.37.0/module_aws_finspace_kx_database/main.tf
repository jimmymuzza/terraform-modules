resource "aws_finspace_kx_database" "finspace_kx_databases" {
  for_each = var.finspace_kx_databases

  environment_id = each.value.environment_id
  name           = each.value.name
  description    = each.value.description
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
}
