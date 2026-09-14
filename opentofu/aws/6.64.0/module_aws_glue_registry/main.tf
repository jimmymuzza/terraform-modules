resource "aws_glue_registry" "glue_registries" {
  for_each = var.glue_registries

  registry_name = each.value.registry_name
  description   = each.value.description
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
