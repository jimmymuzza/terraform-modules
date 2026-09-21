resource "aws_glue_resource_policy" "glue_resource_policies" {
  for_each = var.glue_resource_policies

  policy        = each.value.policy
  enable_hybrid = each.value.enable_hybrid
  region        = each.value.region
}
