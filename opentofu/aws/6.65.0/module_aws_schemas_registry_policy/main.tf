resource "aws_schemas_registry_policy" "schemas_registry_policies" {
  for_each = var.schemas_registry_policies

  policy        = each.value.policy
  registry_name = each.value.registry_name
  region        = each.value.region
}
